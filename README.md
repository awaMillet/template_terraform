# template_terraform

## 概要

terraformを使用しやすいように構築したリポジトリテンプレート

## ディレクトリ構成

以下は，このリポジトリのディレクトリ構成に関するツリー図である．

```sh
template_terraform
├── README.md
├── bin               # テンプレート利用開始のためのシェルスクリプト
├── docs              # ドキュメント
└── src               # Terraformのソースコード
├── template.ini      # 使用開始時に一括変更のための変数管理ファイル
├── template          # AWS-IAM・リソースのポリシーテンプレート
```

## 利用準備

- 一括変数修正

```sh
bash ./bin/template-initial.sh
```

### 参考

- [dockerhub](docker pull hashicorp/terraform:latest)
- [公式docker](https://hub.docker.com/r/hashicorp/terraform)
