class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.bigint :sender
      t.bigint :destination
      t.string :message
      t.boolean :unread
      t.bigint :room_id

      t.timestamps
    end
    add_foreign_key :conversations, :users, column: "sender"
    add_foreign_key :conversations, :users, column: "destination"
    add_foreign_key :conversations, :conversation_rooms, column: "room_id"
  end
end
