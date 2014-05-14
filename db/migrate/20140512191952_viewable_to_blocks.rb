class ViewableToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :viewable, :boolean
  end
end
