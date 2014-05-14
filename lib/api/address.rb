module ShelbyArena

  # This is a helper class for the person object so the data coming 
  # through via Virtus is a hash that has been converted to an array.
  class Address < ApiObject

    attribute :address_id, Integer
    attribute :city, String
    attribute :country, String
    attribute :latitude, String
    attribute :longitude, String
    attribute :postal_code, String
    attribute :primary, Boolean
    attribute :state, String
    attribute :street_line_1, String


    # Constructor.
    #
    # @param data A hash of data
    def initialize(data)   
      # data[0] is 'Address'
      # data[1] is a Hash of address info to match the attributes above.
      initialize_from_json_object(data[1])       
    end

  end

end
