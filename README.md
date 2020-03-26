# ema

プログラミングスクールTECH::EXPERTの最終課題で某フリーマーケットサービスのクローンサイトを作成しました。約3週間、5人チームでアジャイル開発を行いました。

# リンク

http://52.194.83.62

Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。
- Basic認証
  - ID: ema
  - Pass: 2222

# テストユーザー

- 購入用カード情報
  - 番号：4242424242424242
  - 期限：12/20
  - セキュリティコード：123


# 使用技術一覧

- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL 5.6.43
- Haml 5.1.2
- Sass 3.7.4
- jQuery 4.3.5
- Rspec 3.9.1
- AWS
  - EC2
  - S3
- Github



# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|first_name|string|null: false|
|first_name_yomi|string|null: false|
|last_name|string|null: false|
|last_name_yomi|string|null: false|
|birthday|date|null: false|
|email|string|null: false, index: true|
|phone_num|bigint|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|zipcode|integer|null: false|
|encrypted_password|string|null: false|
### Association
has_one :card
has_many :items
has_many :comments
has_many :items, through: :favorites
has_many :favorites

## items table
|Column|Type|Options|
|------|----|-------|
|name|string||null: false|
|info|text|null: false|
|status|string|null: false|
|price|integer|null: false|
|brand|string|
|size|string|null: false|
|from_delivery_area|string|null: false|
|to_delivery_area|string|null: false|
|delivery_date|date|null: false|
|delivery_type|string|null: false|
|delivery_price|integer|null: false|
|condition_id|bigint|null: false|
|deliverydate_id|bigint|null: false|
|deliverypays_id|bigint|null: false|
|prefecture_id|bigint|null: false|
|category_id|integer|null: false|
|user_id|integer|null: false|
|buyer_id|integer|null: false|
### Association
has_many :comments
belongs_to :user, optional: true
belongs_to :category, optional: true
belongs_to :user,optional: true
belongs_to :category,optional: true
belongs_to_active_hash :prefecture, foreign_key: true
belongs_to_active_hash :condition, foreign_key: true
belongs_to_active_hash :deliverypays, foreign_key: true
belongs_to_active_hash :deliverydate, foreign_key: true
has_many :images, dependent: :destroy
has_many :favorites
has_many :users, through: :favorites

## cards table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association


## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item

## images table
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|bigint||
### Association
belongs_to :item

## brands table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association


## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
has_many :items
has_ancestry


## favorites table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
### Association
belongs_to :user, optional: true
belongs_to :item, optional: true