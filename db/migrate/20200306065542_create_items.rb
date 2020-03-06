class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :info
      t.string :status
      t.integer :price
      t.string :size
      t.string :from_delivery_area
      t.string :to_delivery_area
      t.date :delivery_date
      t.string :delivery_type
      t.integer :delivery_price
      t.timestamps
    end
  end
end