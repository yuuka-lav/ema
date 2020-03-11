
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
### Association
has_one :card
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
belongs_to :user
belongs_to :category
belongs_to :brand

## cards table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
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
|image|string|null: false|
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

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
has_many :items

## likes table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
### Association
belongs_to :user
belongs_to :item