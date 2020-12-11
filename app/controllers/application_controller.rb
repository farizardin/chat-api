require 'response_object'
class ApplicationController < ActionController::API
    
    def not_found
        @data = {:error => "not found"}
        response_data = ResponseObject.new
        response_data.set_not_found_code
        response_data.set_error_server_message
        response_data.set_data(@data)
        render json: response_data
    end
    
    def authorization
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            @data = {}
            response_data = ResponseObject.new
            response_data.set_not_found_code
            response_data.set_custom_message(e.message)
            response_data.set_data(@data)
            render json: response_data, status: :unauthorized
        rescue JWT::DecodeError => e
            @data = {}
            response_data = ResponseObject.new
            response_data.set_not_found_code
            response_data.set_custom_message(e.message)
            response_data.set_data(@data)
            render json: response_data, status: :unauthorized
        end
    end
end
