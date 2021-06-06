class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :original_price
      t.string :url

      t.timestamps
    end
  end
end
