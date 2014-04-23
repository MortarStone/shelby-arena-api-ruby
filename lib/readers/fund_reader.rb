module ShelbyArena

  class FundReader < ApiReader

    # Constructor.
    #
    # @param fund_id (optional) The ID of the fund to load.
    def initialize(fund_id = nil)
      if fund_id.nil?
        raise 'The create endpoint is not known yet.'
        @url_new_data_path = nil # Not sure yet
      else
        @url_data_path = "fund/#{fund_id}"
      end      
    end
    
  end

end