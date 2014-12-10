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


    # Helper methods

    def first_name_with_nickname
      begin
        fname = self.person_information['FirstName']
        if self.person_information['NickName'].strip != '' and 
           self.person_information['NickName'].strip != fname
          fname += " (#{self.person_information['NickName']})"
        end
        fname
      rescue
        nil
      end
    end


    def first_name
      begin
        self.person_information['FirstName']
      rescue
        nil
      end
    end


    def last_name
      begin
        self.person_information['NickName']
      rescue
        nil
      end
    end


    def contribution_splits
      begin
        if self.contribution_funds['ContributionFund'].is_a?(Array)
          self.contribution_funds['ContributionFund'].collect { |data| ContributionSplit.new(data) }
        elsif self.contribution_funds['ContributionFund'].is_a?(Hash)
          [ ContributionSplit.new( self.contribution_funds['ContributionFund'] ) ]
        else
          [] # Something else
        end
      rescue
        nil
      end
    end

  end

end
