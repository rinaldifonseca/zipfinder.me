$:.unshift File.dirname(__FILE__) + "../lib"
require "rubygems"
require "zipfinder"
require "rspec"

ZipFinder.configure do |config|
  config.logger = nil
end
