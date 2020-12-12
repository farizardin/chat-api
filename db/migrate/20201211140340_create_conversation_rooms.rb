class CreateConversationRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_rooms do |t|
      t.bigint :participant_1
      t.bigint :participant_2

      t.timestamps
    end
    add_foreign_key :conversation_rooms, :users, column: "participant_1"
    add_foreign_key :conversation_rooms, :users, column: "participant_2"
  end
end
