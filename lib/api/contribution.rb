module ShelbyArena

  class Contribution < ApiObject
    attribute :contribution_id, Integer
    attribute :transaction_number, Integer
    attribute :currency_amount, Float
    attribute :contribution_date, Date
    attribute :contribution_funds, Hash
    attribute :currency_type_id, Integer
    attribute :currency_type_value, String
    attribute :person_id, Integer
    attribute :person_information, Hash
    attribute :person_link, String
    attribute :batch_id, Integer
    attribute :batch_link, String
    attribute :refund_contribution_id, Integer


    # Load the contribution by the specified ID.
    #
    # @param contribution_id The ID of the contribution to load.
    #
    # Returns a new Contribution object.
    def self.load_by_id(contribution_id)
      reader = ContributionReader.new(contribution_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a ContributionReader or Hash object.
    def initialize(reader = nil)    
      if reader.is_a?(ContributionReader)    
        initialize_from_json_object(reader.load_data['Contribution'])
      elsif reader.is_a?(Hash)   
        initialize_from_json_object(reader)
      end
    end

  end

end
