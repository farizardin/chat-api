class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.bigint :sender
      t.bigint :destination
      t.string :message
      t.boolean :unread

      t.timestamps
    end
    add_foreign_key :conversations, :users, column: "sender"
    add_foreign_key :conversations, :users, column: "destination"
  end
end
