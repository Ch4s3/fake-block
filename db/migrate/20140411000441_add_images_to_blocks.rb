class AddImagesToBlocks < ActiveRecord::Migration
  def self.up
  	add_attachment :blocks, :image
  end

  def self.down
  	remove_attachment :blocks, :image
  end
end
