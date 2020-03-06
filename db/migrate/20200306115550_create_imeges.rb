class CreateImeges < ActiveRecord::Migration[5.2]
  def change
    create_table :imeges do |t|
      t.string :image
      t.timestamps
    end
  end
end
