# template_terraform

## 概要

terraformを使用しやすいように構築したリポジトリテンプレート

## ディレクトリ構成

以下は，このリポジトリのディレクトリ構成に関するツリー図である．

```sh
template_terraform
├── bin               # テンプレート利用開始のためのシェルスクリプト・変数管理ファイル
├── docs              # ドキュメント
├── modules           # 共通モジュール
├── src               # Terraformのソースコード
├── template          # リソースのポリシーテンプレート
└── README.md
```

## 利用準備

1. 自分用に[template.ini](bin/template.ini)の変数を設定(2でこれから活用するterraform設定を一括で反映するため)
2. 一括変数修正

```sh
bash ./bin/template-initial.sh
```

3. terraform使用準備をスクリプトで実行(stateLock設定のためのバケット作成)
   - 各環境数分、実行すること

```sh
# 引数なしであればデフォルトdev設定を反映
bash bin/setup-backend.sh
# 引数で環境、リージョン、バケット名を指定する場合
bash bin/setup-backend.sh dev リージョン名(ap-northeast-1など) terraformで使用するバケット名
bash bin/setup-backend.sh stg リージョン名(ap-northeast-1など) terraformで使用するバケット名
bash bin/setup-backend.sh prd リージョン名(ap-northeast-1など) terraformで使用するバケット名
```

### 参考

- [公式docker](https://hub.docker.com/r/hashicorp/terraform)

```sh
docker pull hashicorp/terraform:latest
```
