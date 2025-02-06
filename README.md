# template_terraform

## 概要

terraformを使用しやすいように構築したリポジトリテンプレート

## ディレクトリ構成

以下は，このリポジトリのディレクトリ構成に関するツリー図である．

```sh
template_terraform
├── README.md
├── bin               # テンプレート利用開始のためのシェルスクリプト・変数管理ファイル
├── docs              # ドキュメント
└── src               # Terraformのソースコード
├── template          # AWS-IAM・リソースのポリシーテンプレート
```

## 利用準備

- 一括変数修正

```sh
bash ./bin/template-initial.sh
```

### 参考

- [公式docker](https://hub.docker.com/r/hashicorp/terraform)

```sh
docker pull hashicorp/terraform:latest
```
