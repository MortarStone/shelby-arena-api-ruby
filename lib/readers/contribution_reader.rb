module ShelbyArena

  class ContributionReader < ApiReader

    # Constructor.
    #
    # @param contribution_id (optional) The ID of the contribution to load.
    def initialize(contribution_id = nil)
      if contribution_id.nil?
        raise 'The create endpoint is not known yet.'
        @url_new_data_path = nil # Not sure yet
      else
        @url_data_path = "contribution/#{contribution_id}"
      end      
    end
    
  end

end