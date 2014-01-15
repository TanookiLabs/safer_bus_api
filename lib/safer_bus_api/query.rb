class SaferBusApi
  class Query
    BASE_URL = 'https://mobile.fmcsa.dot.gov/saferbus/resource/v1/'
    
    def self.by_company_name(company_name)
      fetch_data("carriers/#{company_name}")
    end

    def self.by_dot_number(dot_number)
      fetch_data("carrier/#{dot_number}")
    end

    def self.by_mc_number(mc_number)
      fetch_data("carrier/#{mc_number}")
    end

    def self.fetch_data(url_suffix)
      url = "#{BASE_URL}#{url_suffix}.json?start=1&size=10&webKey=#{SaferBusApi::Configuration.api_token}"
      response = Typhoeus.get(url)
      return response.body
    end
  end
end