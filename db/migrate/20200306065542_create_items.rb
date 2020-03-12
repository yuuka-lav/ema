class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :info,                 null: false
      t.string :status,             null: false
      t.integer :price,             null: false
      t.string :size,               null: false
      t.string :from_delivery_area, null: false
      t.string :to_delivery_area,   null: false
      t.date :delivery_date,        null: false
      t.string :delivery_type,      null: false
      t.integer :delivery_price,    null: false
      t.references :condition,      null: false
      t.references :deliverydate,   null: false
      t.references :deliverypays,   null: false
      t.references :prefecture,     null: false
      t.integer :brand_id,          null: false
      t.timestamps
    end
  end
end