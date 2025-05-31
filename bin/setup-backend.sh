#!/bin/sh
set -eu
env=${1:-"dev"}
region=${2:-"ap-northeast-1"}
resource_name=${3:-"<dev_tfbackend_name>"}

# DynamoDB テーブル作成(terraform stateロック用) terraform1.11以降ではDynamoDB不要
aws dynamodb create-table \
    --region $region \
    --table-name $resource_name \
    --deletion-protection-enabled \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
    --tags Key=Name,Value=$resource_name Key=Env,Value=$env

# S3バケット作成(バージョニング有効)
aws s3api create-bucket --bucket $resource_name --region $region --create-bucket-configuration LocationConstraint=$region
aws s3api put-bucket-versioning --bucket $resource_name --versioning-configuration Status=Enabled

# S3バケットの暗号化を有効化
aws s3api put-bucket-encryption --bucket $resource_name --server-side-encryption-configuration '{
    "Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]
}'

# S3バケットのアクセス制御 (ブロックパブリックアクセス)
aws s3api put-public-access-block --bucket $resource_name --public-access-block-configuration '{
    "BlockPublicAcls": true,
    "IgnorePublicAcls": true,
    "BlockPublicPolicy": true,
    "RestrictPublicBuckets": true
}'

echo "######## S3 bucket creation for terraform use is complete!! ########"
