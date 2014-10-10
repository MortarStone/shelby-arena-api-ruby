module ShelbyArena

  class ContributionListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :person_id - (optional) search for receipts containing the PersonId that is passed with this parameter.
    # :start_date - (optional) search for receipts with a received date greater than or equal to this parameter.
    # :end_date - (optional) search for receipts with a received date less than or equal to this parameter.
    def initialize(options = {})
      # page = options[:page] || 1
      # per_page = options[:per_page] || 100

      @url_data_params = {}
      valid_fields.each { |field| @url_data_params[field] = options[ShelbyArena::attr_underscore(field).to_sym] unless options[ShelbyArena::attr_underscore(field).to_sym].nil? }
      @url_data_params['pageIndex'] = options[:page_index]
      @url_data_params['pageSize'] = options[:page_size]
      @url_data_path = 'contribution/list'

    end

    def valid_fields
      %W(FirstName
         LastName
         FromDate
         ToDate
         TypeFilter
         FundFilter
         ProjectFilter
         Transaction
         SortExpression).sort
    end

  end

end

