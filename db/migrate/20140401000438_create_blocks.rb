class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.text :slab
      t.integer :usr_id

      t.timestamps
    end
  end
end
