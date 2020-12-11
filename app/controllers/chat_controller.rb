require 'response_object'
require 'json'
class ChatController < ApplicationController
    def index
        begin
            puts chat_params
            @sender = chat_params[:sender]
            @destination = chat_params[:destination]
            @get_conversations_data = Conversation.select("conversations.message,users.name, conversations.id, conversations.created_at")
                                    .where('conversations.sender =? and conversations.destination =?', @sender,@destination)
                                    .or(Conversation.where('conversations.sender =? and conversations.destination =?', @destination,@sender))
                                    .joins("INNER JOIN users ON users.id = conversations.sender").order(created_at: :desc)

            @conversations_data = {:conversations => @get_conversations_data}

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
            @sender = chat_params[:sender]
            @destination = chat_params[:destination]
            @message = chat_params[:message]
            
            @conversations = Conversation.new
            @conversations.sender = @sender
            @conversations.destination = @destination
            @conversations.message = @message
            @conversations.unread = 1
            if @conversations.save
                @get_conversations_data = Conversation.select("conversations.message,users.name, conversations.id, conversations.created_at")
                                        .where('conversations.sender =? and conversations.destination =?', @sender,@destination)
                                        .or(Conversation.where('conversations.sender =? and conversations.destination =?', @destination,@sender))
                                        .joins("INNER JOIN users ON users.id = conversations.sender").order(created_at: :desc)

                @conversations_data = {:conversations => @get_conversations_data}
                response_data = ResponseObject.new
                response_data.set_success_code
                response_data.sent_message
                response_data.set_data(@conversations_data)
                render json: response_data
            else
                @data = {:error => @conversations.errors}
                response_data = ResponseObject.new
                response_data.set_success_code
                response_data.unsent_message
                response_data.set_data(@data)
                render json: response_data
            end
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
            @sender = chat_params[:sender]
            @destination = chat_params[:destination]

            @get_conversations_data = Conversation.select("conversations.message,users.name, conversations.id, conversations.created_at")
                                    .where('conversations.sender =? and conversations.destination =?', @sender,@destination)
                                    .or(Conversation.where('conversations.sender =? and conversations.destination =?', @destination,@sender))
                                    .joins("INNER JOIN users ON users.id = conversations.sender").order(created_at: :desc)
            
            @conversations_data = {:conversations => @get_conversations_data}
            
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

    def list_chat
    
    end

    private
    def chat_params
        params.permit(
          :sender, :destination, :message, :user_id
        )
    end
end