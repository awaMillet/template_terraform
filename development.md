# 開発・動作確認手順

このドキュメントでは、テンプレートリポジトリを保持したまま、開発・動作確認を行う方法を説明する

## 概要

このリポジトリはTerraformテンプレートであり、`bash ./bin/template-initial.sh`を実行するとプレースホルダー（`<terraform_version>`など）が実際の値に置き換えられます。

そのため、**テンプレートとして保持したまま開発・テストを行うには、Git Worktreeを使用して別環境を作成します。**

---

## 方法1: Git Worktree を使った開発環境構築

### 1. 開発用ブランチとWorktreeの作成

```bash
# 開発用ブランチを作成（初回のみ）
git branch develop

# Worktreeを作成（親ディレクトリに開発環境を作成）
git worktree add ../template_terraform-dev develop
```

これにより以下のような構成になります：

```sh
├── template_terraform/          # ← 元のテンプレート（プレースホルダーのまま保持）
└── template_terraform-dev/      # ← 開発・テスト用環境
```

### 2. 開発環境で初期化スクリプトを実行

```bash
# 開発環境に移動
cd ../template_terraform-dev

# テンプレート初期化スクリプトを実行
bash ./bin/template-initial.sh
```

### 3. Terraform 動作確認（ローカルstate使用）

S3バケットを作成せずに動作確認する場合、backend設定をコメントアウトします。

```bash
# 開発環境のbackend設定をコメントアウト
# ファイル: ../template_terraform-dev/src/dev/_backend.tf
#
# 以下の部分をコメントアウト：
#   backend "s3" {
#     bucket  = "example-dev-terraform-backend"
#     region  = "ap-northeast-1"
#     key     = "terraform.tfstate"
#     encrypt = true
#   }
```

### 4. Terraform の初期化とplan実行

```bash
# dev環境に移動
cd src/dev

# AWS認証情報を設定（プロファイルを指定）
export AWS_PROFILE=認証名

# Terraform 初期化
terraform init -reconfigure

# 構文チェック
terraform validate

# 実行計画の確認
terraform plan
```

---

## 方法2: CI/CD（GitHub Actions）での自動テスト

PR作成時に自動でTerraform Planを実行し、構文チェックと実行計画を確認する方法です。

### 1. GitHub Secretsの設定

GitHubリポジトリの設定画面でAWS認証情報を登録します：

1. GitHubリポジトリページを開く
2. `Settings` → `Secrets and variables` → `Actions` に移動
3. `New repository secret` をクリックして以下を追加：

| Secret名 | 値 |
|---------|-----|
| `AWS_ACCESS_KEY_ID` | AWSアクセスキーID |
| `AWS_SECRET_ACCESS_KEY` | AWSシークレットアクセスキー |

### 2. GitHub Actionsワークフロー

すでに `.github/workflows/terraform-plan.yml` が設定されています。

このワークフローは以下のタイミングで自動実行されます：

- mainブランチへのPR作成時
- `src/`, `modules/`, `bin/` ディレクトリの変更時

### 3. 動作内容

GitHub Actionsは以下の処理を自動実行します：

1. テンプレート初期化スクリプトを実行
2. Backend設定をコメントアウト（ローカルstate使用）
3. `terraform init` で初期化
4. `terraform validate` で構文チェック
5. `terraform plan` で実行計画を作成
6. PRに実行計画の結果をコメント

### 4. 使い方

```bash
# 開発ブランチで変更を加える
git checkout -b feature/add-new-module

# ファイルを変更...
# モジュール追加、設定変更など

# コミットしてプッシュ
git add .
git commit -m "add: 新しいモジュール追加"
git push origin feature/add-new-module

# GitHubでPRを作成
# → 自動でTerraform Planが実行され、結果がPRにコメントされる
```

### 5. PRのマージ

GitHub Actionsでterraform planが成功したら、PRをマージできます：

```bash
# PRをマージ後、ローカルのmainブランチを更新
git checkout main
git pull origin main
```

---

## 方法3: 元のテンプレートリポジトリに変更を反映

開発環境（Worktree）で変更を加えた後、元のテンプレートリポジトリに反映する手順：

```bash
# 開発環境で変更をコミット
cd ../template_terraform-dev
git add .
git commit -m "update: モジュール追加"

# 元のテンプレートリポジトリに戻る
cd ../template_terraform

# 変更をマージ
git merge develop
```

---

## Worktree の削除

開発環境が不要になった場合：

```bash
# 元のリポジトリに戻る
cd /XXX/template_terraform

# Worktree を削除
git worktree remove ../template_terraform-dev

# ブランチも削除する場合
git branch -d develop
```

---

## まとめ

### 開発環境の使い分け

| 方法 | 用途 | メリット |
|------|------|----------|
| **方法1: Git Worktree** | ローカルでの開発・動作確認 | - すぐに使える<br>- 元のテンプレートを保持<br>- 自由に実験できる |
| **方法2: CI/CD** | PR作成時の自動テスト | - 自動化<br>- レビュー前に問題を発見<br>- チーム開発に最適 |
| **方法3: 変更の反映** | 開発環境→テンプレートへの反映 | - 開発内容をテンプレートに統合 |

### 推奨ワークフロー

1. **開発開始**: Git Worktreeで開発環境を作成
2. **ローカルテスト**: `terraform plan` で動作確認
3. **PRを作成**: GitHub Actionsで自動テスト
4. **マージ**: テンプレートに反映

### ディレクトリ構成

```sh
/XXX/
├── template_terraform/              # ← 元のテンプレート（プレースホルダー保持）
│   ├── .github/workflows/          # ← GitHub Actions設定
│   ├── DEVELOPMENT.md              # ← このドキュメント
│   ├── src/dev/_backend.tf         # ← <dev_tfbackend_name> のまま
│   └── ...
│
└── template_terraform-dev/          # ← 開発・テスト環境（Worktree）
    └── src/dev/_backend.tf         # ← 実際の値 or コメントアウト済み
```

---

## トラブルシューティング

### AWS認証エラーが発生する場合

```bash
# 利用可能なプロファイルを確認
grep '^\[' ~/.aws/credentials | sed 's/\[//g' | sed 's/\]//g'

# プロファイルの認証確認
aws sts get-caller-identity --profile <プロファイル名>

# 有効なプロファイルを環境変数に設定
export AWS_PROFILE=<プロファイル名>
```

### GitHub Actionsでterraform planが失敗する場合

1. **AWS認証情報の確認**:
   - GitHub Secrets に `AWS_ACCESS_KEY_ID` と `AWS_SECRET_ACCESS_KEY` が正しく設定されているか確認

2. **権限の確認**:
   - 設定したAWSユーザーにIAM、EC2、VPC、S3などの読み取り権限があるか確認

3. **ワークフローログの確認**:
   - GitHub Actions の `Actions` タブでログを確認

### S3 Backend を使用したい場合

README.mdに記載されている手順でS3バケットを作成してください：

```bash
# 開発環境でバケット作成
cd ../template_terraform-dev
bash bin/setup-backend.sh dev ap-northeast-1 example-dev-terraform-backend

# backend設定のコメントアウトを解除して初期化
cd src/dev
terraform init
```

---
