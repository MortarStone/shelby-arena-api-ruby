require 'typhoeus'
require 'json'

# The path to the lib directory.
SHELBY_ARENA_LIB_DIR = File.dirname(__FILE__)

require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'

module ShelbyArena

  class Api

    class << self
      attr_reader :username, :password, :api_key, :api_secret, :service_url
    end    

    def self.connect(username, password, api_key, api_secret, service_url)
      @username = username
      @password = password
      @api_key = api_key      
      @api_secret = api_secret
      @service_url = service_url
    end    

  end

end
