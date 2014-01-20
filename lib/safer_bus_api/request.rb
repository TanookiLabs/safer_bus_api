module SaferBusApi
  class Request
    def initialize(opts={})
      @dot_number = opts[:dot_number]
      @company_name = opts[:company_name]
      @mc_number = opts[:mc_number]

      @response = nil
    end

    def perform
      if @dot_number.present?
        raw_response = SaferBusApi::Query.by_dot_number(@dot_number)
      elsif @company_name.present?
        raw_response = SaferBusApi::Query.by_company_name(@company_name)
      elsif @mc_number.present?
        raw_response = SaferBusApi::Query.by_mc_number(@mc_number)
      else
        raise 'SaferBusApi Error: Need to set either a dot_number, company_name or mc_number.' 
      end

      @response = Response.new(raw_response)
    end

    def response
      @response
    end
  end
end
