require 'response_object'
class ErrorsController < ApplicationController
    def error_404
        @requested_path = request.path
        @data = {:error => @requested_path}
        response_data = ResponseObject.new
        response_data.set_error_server_code
        response_data.set_custom_message("Route tidak ditemukan, baca panduan chat-api")
        response_data.set_data(@data)
        render json: response_data
    end
end
