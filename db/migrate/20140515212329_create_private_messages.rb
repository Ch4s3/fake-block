class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer  "sender_id"
      t.integer  "receiver_id"
      t.text     "subject"
      t.text     "body"
      t.datetime "sent"
      t.boolean "read", :default => false

      t.timestamps
    end
  end
end
