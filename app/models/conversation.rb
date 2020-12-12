class Conversation < ApplicationRecord
    validates :sender, presence: true
    validates :destination, presence: true
    validates :message, presence: true
    has_one :user
    has_one :conversation_room
end