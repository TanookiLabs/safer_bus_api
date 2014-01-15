module SaferBusApi
  class Response
    def initialize(raw_data)
      @raw_data = raw_data
    end

    def data
      JSON.parse(@raw_data)
    end

    def raw_data
      @raw_data
    end
  end
end