module ShelbyArena

  class FamilyReader < ApiReader

    # Constructor.
    #
    # @param family_id (optional) The ID of the family to load.
    def initialize(family_id = nil)
      if family_id.nil?
        raise 'The create endpoint is not known yet.'
        @url_new_data_path = nil # Not sure yet
      else
        @url_data_path = "family/#{family_id}"
      end
    end
    
  end

end


