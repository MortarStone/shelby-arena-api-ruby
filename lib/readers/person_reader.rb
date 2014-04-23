module ShelbyArena

  class PersonReader < ApiReader

    # Constructor.
    #
    # @param person_id (optional) The ID of the person to load.
    def initialize(person_id = nil)
      if person_id.nil?
        raise 'The create endpoint is not known yet.'
        @url_new_data_path = nil # Not sure yet
      else
        @url_data_path = "person/#{person_id}"
      end
    end
    
  end

end


