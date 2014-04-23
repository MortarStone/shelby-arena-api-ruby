module ShelbyArena

  class FundListReader < ApiReader

    # Constructor.
    def initialize(options = {})
      # page = options[:page] || 1
      # per_page = options[:per_page] || 100

      @url_data_params = {}
      valid_fields.each { |field| @url_data_params[field] = options[ShelbyArena::attr_underscore(field).to_sym] unless options[ShelbyArena::attr_underscore(field).to_sym].nil? }
      @url_data_path = 'fund/list'
    end

    def valid_fields
      %W(Active
         CanPledge
         EndDate
         FundId
         FundName
         OnlineName
         StartDate
         TaxDeductible).sort
    end

  end

end
