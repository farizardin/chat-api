class AddLastMessageToConversationRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :conversation_rooms, :last_message, :bigint
    add_foreign_key :conversation_rooms, :conversations, column: "last_message"
  end
end
