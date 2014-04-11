module ShelbyArena

  class ShelbySession < ApiObject
    attribute :id, String
    attribute :expires_at, DateTime

    # Constructor.
    #
    # @param response_data Session response data from the Shelby service.
    def initialize(response_data)  
      self.id = response_data['ApiSession']['SessionID']
      self.expires_at = response_data['ApiSession']['DateExpires']
    end

  end

end
