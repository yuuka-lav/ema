class AddItemIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :item_id, :integer
  end
end
