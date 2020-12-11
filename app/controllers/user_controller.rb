require 'response_object'
require 'json_web_token'
class UserController < ApplicationController
    def create
        begin
            @users = User.new(user_params)
            if @users.save
                @data = {:user => @users} 
                response_data = ResponseObject.new
                response_data.set_custom_message("User berhasil disimpan")
            else
                errors = {:errors => @users.errors.full_messages}
                @data = errors
                response_data = ResponseObject.new
                response_data.set_custom_message("User gagal disimpan")
            end
            response_data.set_success_code
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

    private
  
    def user_params
      params.permit(
        :name, :username, :password, :email, :password_confirmation
      )
    end
end