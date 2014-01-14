require "safer_bus_api/version"
require 'duly_noted/configuration'

module SaferBusApi
  BASE_URL = 'https://mobile.fmcsa.dot.gov/saferbus/resource/v1/'

  def configure
    yield SaferBusApi::Configuration
  end

  def initialize(opts={})
    @dot_number = opts[:dot_number]
    @response = nil
  end

  def perform
    raise 'Cannot perform SaferBusApi api-request with empty dot_number' if @dot_number.blank?
    @response = SaferBusApi.query_by_dot_number(@dot_number)
  end

  def response
    @response
  end

  def self.query_by_company_name(company_name)
    fetch_data("carriers/#{company_name}")
  end

  def self.query_by_dot_number(dot_number)
    fetch_data("carrier/#{dot_number}")
  end

  def self.query_by_mc_number(mc_number)
    fetch_data("carrier/#{mc_number}")
  end

  def self.fetch_data(url_suffix)
    url = "#{BASE_URL}#{url_suffix}.json?start=1&size=10&webKey=#{SaferBusApi::Configuration.api_token}"
    response = Typhoeus.get(url)
    return JSON.parse(response.body)
  end

end