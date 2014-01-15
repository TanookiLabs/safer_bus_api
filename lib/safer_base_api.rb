require 'typhoeus'
require 'safer_bus_api/version'
require 'safer_bus_api/configuration'
require 'safer_bus_api/query'
require 'safer_bus_api/request'
require 'safer_bus_api/response'

class SaferBusApi
  def configure
    yield SaferBusApi::Configuration
  end
end