class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :name
      t.string :theme
      t.string :category
      t.float :price
      t.integer :min_age
      t.integer :max_age
      t.integer :reg_limit

      t.timestamps null: false
    end
  end
end
