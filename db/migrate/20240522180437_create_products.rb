class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :url
      t.string :size
      t.integer :quantity

      t.timestamps
    end
  end
end
