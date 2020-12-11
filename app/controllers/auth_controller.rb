require 'response_object'
require 'json_web_token'
class AuthController < ApplicationController
    before_action :authorize_request, except: :login

    def login
        begin
            @user = User.find_by_username(params[:username])
            if @user&.authenticate(params[:password])
                token = JsonWebToken.encode(user_id: @user.id)
                time = Time.now + 24.hours.to_i
                @data = { 
                            :token => token, 
                            :exp => time.strftime("%m-%d-%Y %H:%M"),
                            :username => @user.username
                        }
            
            else
                @data = { :error => 'unauthorized' }
            end
            response_data = ResponseObject.new
            response_data.set_success_code
            response_data.set_custom_message("Login berhasil")
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
  
    def login_params
        params.permit(:username, :password)
    end
end