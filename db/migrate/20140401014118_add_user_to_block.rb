class AddUserToBlock < ActiveRecord::Migration
  def change
  	remove_column :blocks, :usr_id, :integer
  	add_column  :blocks, :user_id, :integer
  end
end
