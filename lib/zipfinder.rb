$:.push File.expand_path("../lib", __FILE__)

require 'ostruct'
require "forwardable"
require 'json'
require 'restclient'
require 'logger'
require "zipfinder/version"
require "zipfinder/loggable"
require "zipfinder/response_handler"
require "zipfinder/rest_client_adapter"
require "zipfinder/exceptions"
require "zipfinder/client"

module ZipFinder
  BASE_URL = 'http://zipfinder.me/zipcode'
  class << self
    attr_accessor :logger
  end

  def self.configure
    yield self
  end
end

ZipFinder.configure do |config|
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger::ERROR
end


