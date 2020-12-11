require 'response_object'
class UserController < ApplicationController
    def create
        @users = User.new(user_params)
        if @users.save
            @data = @users
            response_data = ResponseObject.new
            response_data.set_success_code
            response_data.set_custom_message("User berhasil disimpan")
            response_data.set_data(@data)
            render json: response_data
        else
            errors = {:errors => @users.errors.full_messages}
            @data = errors
            response_data = ResponseObject.new
            response_data.set_success_code
            response_data.set_custom_message("User gagal disimpan")
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