class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
