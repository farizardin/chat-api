require 'response_object'
require 'json'
class ChatController < ApplicationController
    before_action :authorization

    def index
        begin
            @participant = @current_user.id
            @sub_query = Conversation.select("conversations.room_id as id, sum(conversations.unread) as unread_notification").where("conversations.destination = ?", @participant).group("room_id").to_sql
            @get_conversation_rooms_data = ConversationRoom.select("conversation_rooms.id, u1.name as participant_one, u2.name as participant_two, c.message as message, unread.unread_notification")
                                        .joins("INNER JOIN users as u1 ON u1.id = conversation_rooms.participant_1")
                                        .joins("INNER JOIN users as u2 ON u2.id = conversation_rooms.participant_2")
                                        .joins("LEFT JOIN conversations as c on c.id = conversation_rooms.last_message")
                                        .joins("LEFT JOIN (#{@sub_query}) as unread on unread.id = conversation_rooms.id")
                                        .where('conversation_rooms.participant_1 =? or conversation_rooms.participant_2 =?', @participant, @participant)           
            
            @conversations_data = {:rooms => @get_conversation_rooms_data}

            response_data = ResponseObject.new
            response_data.set_success_code
            response_data.set_success_message
            response_data.set_data(@conversations_data)
            render json: response_data
        rescue => error
            @data = {:error => error.message}
            response_data = ResponseObject.new
            response_data.set_error_server_code
            response_data.set_error_server_message
            response_data.set_data(@data)
            render json: response_data
        end
    end

    def send_message
        begin
            @sender = @current_user.id
            @destination = chat_params[:destination]
            @find_destination = User.find_by(:id => @destination)
            @message = chat_params[:message]
            if @destination.to_i != @sender and @find_destination != nil and @message != nil
                @message_data = Conversation.new
                @message_data.sender = @sender
                @message_data.destination = @destination
                @message_data.message = @message
                @message_data.unread = 1
                @conversation_rooms = ConversationRoom.where('conversation_rooms.participant_1 =? and conversation_rooms.participant_2 =?', @sender, @destination)
                            .or(ConversationRoom.where('conversation_rooms.participant_1 =? and conversation_rooms.participant_2 =?', @destination, @sender)).limit(1)
                @room_check = @conversation_rooms.length
                if @room_check == 0
                    @new_room = ConversationRoom.new
                    @new_room.participant_1 = @sender
                    @new_room.participant_2 = @destination
                    if @new_room.save
                        @room_id = @new_room.id
                    else
                        @data = {:error => @message_data.errors}
                        response_data = ResponseObject.new
                        response_data.set_error_server_code
                        response_data.set_error_server_message
                    end
                else
                    @room_id = @conversation_rooms[0].id
                end
                @message_data.room_id = @room_id
                @read_message = Conversation.where(:sender => @destination).where(:destination => @sender).update_all(:unread => 0)
                if @message_data.save
                    @get_conversations_data = Conversation.select("conversations.message,users.name, conversations.id, conversations.created_at")
                                            .where('conversations.sender =? or conversations.destination =?', @destination, @destination)
                                            .where('conversations.room_id =?', @room_id)
                                            .joins("INNER JOIN users ON users.id = conversations.sender")
                    @update_rooms = ConversationRoom.find(@room_id).update(:last_message => @message_data.id)
                    @data = {:message_data => @message_data, :conversations => @get_conversations_data}
                    response_data = ResponseObject.new
                    response_data.set_success_code
                    response_data.sent_message
                else
                    @data = {:error => @message_data.errors}
                    response_data = ResponseObject.new
                    response_data.set_success_code
                    response_data.unsent_message
                end
            else
                @data = {:error => "Tidak dapat mengirim pesan, pastikan pesan ditujukan kepada pengguna yang benar"}
                response_data = ResponseObject.new
                response_data.set_not_found_code
                response_data.unsent_message
            end
            response_data.set_data(@data)
            render json: response_data 
        rescue => error
            @data = {:error => error.message}
            response_data = ResponseObject.new
            response_data.set_error_server_code
            response_data.set_error_server_message
            response_data.set_data(@data)
            render json: response_data
        end
    end

    def open_conversation
        begin
            @room_id = chat_params[:id]
            @destination = @current_user.id
            @read_message = Conversation.where(:destination => @destination).where(:room_id => @room_id).update_all(:unread => 0)
            @get_conversations_data = Conversation.select("conversations.message,users.name, conversations.id, conversations.created_at")
                                                        .where('conversations.sender =? or conversations.destination =?', @destination, @destination)
                                                        .where('conversations.room_id =?', @room_id)
                                                        .joins("INNER JOIN users ON users.id = conversations.sender")
            
            @conversations_data = {:conversations => @get_conversations_data, :read => @read_message}
            
            response_data = ResponseObject.new
            response_data.set_success_code
            response_data.set_success_message
            response_data.set_data(@conversations_data)
            render json: response_data
        rescue => error
            @data = {:error => error.message}
            response_data = ResponseObject.new
            response_data.set_error_server_code
            response_data.set_error_server_message
            response_data.set_data(@data)
            render json: response_data
        end
    end

    private
    def chat_params
        params.permit(
          :sender, :destination, :message, :user_id, :room_id, :id
        )
    end
end