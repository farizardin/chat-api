require 'response_object'
class ChatController < ApplicationController
    def index
        begin
            @data = ["a","b","c","d","e"]
            @response_data = ResponseObject.new
            @response_data.set_code("200")
            @response_data.set_messages("Berhasil mengambil data")
            @response_data.set_data(["a","b","c","d","e"])
            puts @response_data.get_code
            render json: @response_data
        rescue
            @data = []
            @response_data = ResponseObject.new
            @response_data.set_code("500")
            @response_data.set_messages("Terjadi kesalahan pada server")
            @response_data.set_data(@data)
            render json: @response_data
        end
    end
end