class CreateBanneds < ActiveRecord::Migration
  def change
    create_table :banneds do |t|
      t.string :name
      t.string :protected_camper
      t.string :camper

      t.timestamps null: false
    end
  end
end
