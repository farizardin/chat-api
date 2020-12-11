class ResponseObject

    SUCCESS_CODE = "200"
    ERROR_SERVER_CODE = "500"
    ERROR_NOT_FOUND_CODE = "404"
    SUCCESS_MESSAGE = "Data berhasil diambil"
    SENT_MESSAGE = "Pesan berhasil dikirim"
    UNSENT_MESSAGE = "Gagal dikirim"
    ERROR_SERVER_MESSAGE = "Terjadi kesalahan pada server"

    def initialize
        @code = nil
        @data = nil
        @message = nil
    end

    def set_success_code
        @code = SUCCESS_CODE
    end

    def set_error_server_code
        @code = ERROR_SERVER_CODE
    end

    def set_not_found_code
        @code = ERROR_NOT_FOUND_CODE
    end

    def set_data(data)
        @data = data
    end

    def set_success_message
        @message = SUCCESS_MESSAGE
    end

    def sent_message
        @message = SENT_MESSAGE
    end

    def unsent_message
        @message = UNSENT_MESSAGE
    end

    def set_error_server_message
        @message = ERROR_SERVER_MESSAGE
    end

    def set_custom_message(message)
        @message = message
    end

    def get_code
        return @code
    end

    def get_data
        return @data
    end

    def get_messages
        return @message
    end
end