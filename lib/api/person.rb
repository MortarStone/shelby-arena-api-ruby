module ShelbyArena

  class Person < ApiObject
    attribute :addresses, Array[ShelbyArena::Address]
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
      @writer_object = PersonWriter
      if reader.is_a?(PersonReader)
        initialize_from_json_object(reader.load_data['Person'])
      elsif reader.is_a?(Hash) 
        initialize_from_json_object(reader)        
      else # new empty
        raise 'Not sure about this one yet'
        # reader = PersonReader.new
        # initialize_from_json_object(reader.load_new['person'])
      end         
    end


    # def is_head_of_household?
    #  # I do not see a way to get this yet.
    # end


    def active
      self.record_status_value.downcase == 'active'
    end


    def family_role
      self.family_member_role_value.blank? ? 'Other' : self.family_member_role_value
    end


    def is_child?
      self.family_member_role_value.downcase == 'child'
    end

    def email_address
      self.first_active_email
    end
  end

end
