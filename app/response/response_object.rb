class ResponseObject
    def initialize()
        @code = ""
        @data = ""
        @message = ""
    end

    def set_code(code)
        @code = code
    end

    def set_data(data)
        @data = data
    end

    def set_messages(message)
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