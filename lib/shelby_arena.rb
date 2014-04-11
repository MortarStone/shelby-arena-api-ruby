require 'typhoeus'
require 'json'
require 'xmlsimple'

# The path to the lib directory.
SHELBY_ARENA_LIB_DIR = File.dirname(__FILE__)

require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'

module ShelbyArena

  class Api

    class << self
      attr_reader :username, :password, :api_key, :api_secret, :service_url, :session_key
    end    

    def self.request_session(username, password, api_key, service_url)
      @username    = username
      @password    = password
      @api_key     = api_key   
      @service_url = service_url
      ShelbySession.new(ShelbyArena.request_session)
    end    

    def self.connect(session_key, api_secret, service_url)
      @session_key = session_key
      @api_secret  = api_secret   
      @service_url = service_url
      true
    end

  end

end
