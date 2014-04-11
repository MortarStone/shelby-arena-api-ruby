module ShelbyArena

  class PersonListReader < ApiReader

    # Constructor.
    def initialize(options = {})
      # page = options[:page] || 1
      # per_page = options[:per_page] || 100

      @url_data_params = {}
      valid_fields.each { |field| @url_data_params[field] = options[ShelbyArena::attr_underscore(field).to_sym] unless options[ShelbyArena::attr_underscore(field).to_sym].nil? }
      @url_data_path = 'person/list'
    end

    def valid_fields
      %W(Address 
         altID 
         areaId 
         birthdate 
         email 
         giftID 
         loginID 
         firstName 
         lastName 
         personID 
         phone 
         profileID 
         onlyConnected 
         searchDistance 
         latitude 
         longitude 
         campusID 
         includeInactive 
         memberStatus 
         attributeID 
         attributeIntValue 
         attributeVarcharValue 
         attributeDateTimeValue 
         attributeDecimalValue 
         name).sort
    end

  end

end