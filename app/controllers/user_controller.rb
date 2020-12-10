require 'response_object'
class UserController < ApplicationController
    def create
        # @users = User.new()
        form_check = user_params.values.all? { |value| value != nil }
        puts user_params
        if form_check
            if user_params[:password] == user_params[:password_confirmation]
                @users = User.new(user_params)
                if @users.save
                    @data = @users
                    response_data = ResponseObject.new
                    response_data.set_success_code
                    response_data.set_custom_message("User berhasil disimpan")
                    response_data.set_data(@data)
                    render json: response_data
                else
                    errors = {:errors => @users.errors}
                    @data = [errors]
                    response_data = ResponseObject.new
                    response_data.set_success_code
                    response_data.set_custom_message(@users.errors.full_messages)
                    response_data.set_data(@data)
                    render json: response_data
                end
            else

                @data = []
                response_data = ResponseObject.new
                response_data.set_success_code
                response_data.set_custom_message("Password tidak sesuai")
                response_data.set_data(@data)
                render json: response_data
            end
        else
            @data = []
            response_data = ResponseObject.new
            response_data.set_success_code
            response_data.set_custom_message("Pastikan formulir diisi dengan benar")
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