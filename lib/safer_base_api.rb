  require "safer_bus_api/version"
  require 'safer_bus_api/configuration'

  module SaferBusApi
    BASE_URL = 'https://mobile.fmcsa.dot.gov/saferbus/resource/v1/'

    def configure
      yield SaferBusApi::Configuration
    end

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

    class Request
      def initialize(opts={})
        @dot_number = opts[:dot_number]
        @company_name = opts[:company_name]
        @mc_number = opts[:mc_number]

        @response = nil
      end

      def perform
        if @dot_number.present?
          @response = SaferBusApi::Query.by_dot_number(@dot_number)
        elsif @company_name.present?
          @response = SaferBusApi::Query.by_company_name(@company_name)
        elsif @mc_number.present?
          @response = SaferBusApi::Query.by_mc_number(@mc_number)
        else
          raise 'SaferBusApi Error: Need to set either a dot_number, company_name or mc_number.' 
        end

        Response.new(@response)
      end

      def response
        @response
      end
    end

    class Query
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