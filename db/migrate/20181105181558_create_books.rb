class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher
      t.references :shop
      t.integer :copies_in_stock
      t.integer :copies_sold
      t.timestamps
    end
  end
end
