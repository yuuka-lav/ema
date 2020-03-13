class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :info,                 null: false
      t.string :status
      t.integer :price,             null: false
      t.string :brand
      t.string :size
      t.string :from_delivery_area
      t.string :to_delivery_area
      t.date :delivery_date
      t.string :delivery_type
      t.integer :delivery_price
      t.references :condition,      null: false
      t.references :deliverydate,   null: false
      t.references :deliverypays,   null: false
      t.references :prefecture,     null: false
      t.integer :category_id,       null: false
      t.timestamps

    end
  end
end