class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :camp_id
      t.integer :week
      t.integer :reg_limit

      t.timestamps null: false
    end
  end
end
