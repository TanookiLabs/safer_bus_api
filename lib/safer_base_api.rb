$:.unshift File.dirname(__FILE__)

require 'safer_bus_api/version'
require 'safer_bus_api/configuration'
require 'safer_bus_api/query'
require 'safer_bus_api/request'
require 'safer_bus_api/response'


module SaferBusApi
  def configure
    yield SaferBusApi::Configuration
  end
end