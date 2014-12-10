module ShelbyArena

  class ContributionSplit < ApiObject
    attribute :amount, Float
    attribute :fund_id, Integer
    attribute :fund_name, String

    # Constructor.
    #
    # @param data .
    def initialize(data)    
      self.amount = data['Amount'].to_f
      self.fund_id = data['Fund']['FundId'].to_i
      self.fund_name = data['Fund']['FundName']
    end

  end

end
