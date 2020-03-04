
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
|password|string|null: false|
|mail_address|string|null: false|
|phone_num|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|zipcode|integer|null: false|
### Association
has_one :credit_card
has_many :items
has_many :comments
has_many :likes

## items table
|Column|Type|Options|
|------|----|-------|
|name|string||null: false|
|info|text|null: false|
|status|string|null: false|
|price|integer|null: false|
|size|string|null: false|
|from_delivery_area|string|null: false|
|to_delivery_area|string|null: false|
|delivery_date|date|null: false|
|delivery_type|string|null: false|
|delivery_price|integer|null: false|
|user_id|integer|null: false|
|seller_id|integer|null: false|
### Association
has_many :comments
has_many :images
belongs_to :category
belongs_to :brand

## credit_cards table
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expination_year|integer|null: false|
|expination_month|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user

## comments table
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item

## images table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
belongs_to :item

## brands table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
has_many :items

## first_categorys table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
has_many :items

## second_categorys table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association

## third_categorys table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association

## likes table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
### Association
belongs_to :user
belongs_to :item