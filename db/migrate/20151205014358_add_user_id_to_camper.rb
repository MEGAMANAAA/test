class AddUserIdToCamper < ActiveRecord::Migration
  def change
    add_column :campers, :user_id, :integer
  end
end
