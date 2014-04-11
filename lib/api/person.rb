module ShelbyArena

  class Person < ApiObject
    attribute :addresses, Array[Address]
    attribute :campus_id, Integer
    attribute :campus_name, String
    attribute :family_id, Integer
    attribute :family_member_role_id, Integer
    attribute :family_member_role_value, String
    attribute :gender, String
    attribute :first_name, String
    attribute :nick_name, String
    attribute :last_name, String
    attribute :birth_date, Date
    attribute :age, Integer
    attribute :home_phone, String
    attribute :cell_phone, String
    attribute :first_active_email, String  
    attribute :member_status_id, Integer
    attribute :member_status_value, String
    attribute :person_guid, String
    attribute :person_id, Integer
    attribute :person_link, String
    attribute :record_status_value, String
    attribute :bloblink, String
    attribute :area_name, String


    # Loads the user by the specified ID.
    #
    # @param person_id The ID of the person to load.
    #
    # Returns a new Person object.
    def self.load_by_id(person_id)
      reader = PersonReader.new(person_id)
      self.new(reader)
    rescue
      nil      
    end


    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a PersonReader or Hash object.
    # @param options (optional) Options for including more information.
    def initialize(reader = nil, options = {})   
      # @writer_object = PersonWriter
      # if reader.is_a?(PersonReader)
      #   initialize_from_json_object(reader.load_feed['person'])
      # elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      # else # new empty
      #   reader = PersonReader.new
      #   initialize_from_json_object(reader.load_new['person'])
      # end         
    end


    # def is_head_of_household?
    #   (!self.household_member_type.nil? and self.household_member_type['name'].downcase == 'head')
    # end


    # def family_role
    #   begin
    #     self.household_member_type['name']
    #   rescue
    #     'Other'
    #   end
    # end


    # def is_child?
    #   begin
    #     self.household_member_type['name'].downcase == 'child'
    #   rescue
    #     false
    #   end
    # end


    # def addresses
    #   return nil if @addresses.nil?
    #   return @addresses_cache unless @addresses_cache.nil?

    #   @addresses_cache = []
    #   @addresses['address'].each do |addr|
    #     @addresses_cache << PersonAddress.new(
    #       addr['addressType']['name'].downcase == 'primary', 
    #       addr['address1'], 
    #       addr['address2'], 
    #       addr['city'], 
    #       addr['stProvince'], 
    #       addr['postalCode']
    #     )
    #   end    
    #   @addresses_cache
    # end

    # def email_addresses
    #   self.communications.collect { |c| c[:is_email?] ? c[:value] : nil }.compact
    # end

    # def all_numbers
    #   self.communications.collect { |c| (c[:is_phone?] or c[:is_mobile?]) ? c[:value] : nil }.compact
    # end  

    # def phone_numbers
    #   self.communications.collect { |c| c[:is_phone?] ? c[:value] : nil }.compact
    # end  

    # def mobile_numbers
    #   self.communications.collect { |c| c[:is_mobile?] ? c[:value] : nil }.compact
    # end  

    # def communications
    #   return nil if @communications.nil?
    #   return @communications_cache unless @communications_cache.nil?

    #   @communications_cache = []
    #   @communications['communication'].each do |comm|
    #     @communications_cache << PersonCommunication.new(
    #       comm['communicationType']['name'].to_s.downcase.include?('phone'), 
    #       comm['communicationType']['name'].to_s.downcase.include?('mobile'), 
    #       comm['communicationType']['name'].to_s.downcase.include?('email'), 
    #       comm['communicationType']['name'], 
    #       comm['communicationValue'],
    #       comm['preferred'].to_s.downcase == 'true'
    #     )
    #   end    
    #   @communications_cache      
    # end


    # def _field_map
    #   {:id => '@id',
    #    :uri => '@uri',
    #    :imageUri => '@imageURI',
    #    :oldId => '@oldID',
    #    :iCode => '@iCode',
    #    :householdId => '@householdID',
    #    :oldHouseholdId => '@oldHouseholdID'}
    # end
    

  end

end
