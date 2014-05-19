class AddExpirationDateTimeToBlocks < ActiveRecord::Migration
  def change
  	add_column :blocks, :expiration, :datetime
  end
end
