module ShelbyArena

  class Fund < ApiObject
    attribute :fund_id, Integer
    attribute :fund_name, String
    attribute :online_name, String
    attribute :start_date, Date
    attribute :end_date, Date
    attribute :active, Boolean
    attribute :can_pledge, Boolean
    attribute :tax_deductible, Boolean


    # Load the fund by the specified ID.
    #
    # @param fund_id The ID of the fund to load.
    #
    # Returns a new Fund object.
    def self.load_by_id(fund_id)
      reader = FundReader.new(fund_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a FundReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(FundReader)    
        initialize_from_json_object(reader.load_data['Fund'])
      elsif reader.is_a?(Hash)   
        initialize_from_json_object(reader)
      end
    end

  end

end
