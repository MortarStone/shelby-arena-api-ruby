require File.dirname(__FILE__) + '/person.rb'

module ShelbyArena

  class Family < ApiObject
    attribute :family_id, Integer
    attribute :family_name, String
    attribute :family_members, Array

    # Loads the family by the specified ID.
    #
    # @param family The ID of the family to load.
    #
    # Returns a new Family object.
    def self.load_by_id(family_id)
      reader = FamilyReader.new(family_id)
      self.new(reader)
    rescue
      nil      
    end


    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a PersonReader or Hash object.
    # @param options (optional) Options for including more information.
    def initialize(reader = nil, options = {})  
      #@writer_object = FamilyWriter
      if reader.is_a?(FamilyReader)
        initialize_from_json_object(reader.load_data['Family'])        
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      else # new empty
        raise 'Not sure about this one yet'
        # reader = FamilyReader.new
        # initialize_from_json_object(reader.load_new['family'])
      end      

      # The data loaded from family_members is useless.  It is best to just reload all the family 
      # members as person objects so all attributes are set.     
      # fm[0] is 'Person'
      # fm[1] is a Hash of person info to match some, not all, of the attributes above.
      method_to_call = "#{ShelbyArena::attr_underscore('family_members')}="
      self.send(method_to_call, self.family_members.collect { |fm| ShelbyArena::Person.load_by_id(fm[1]['PersonID']) })       
    end

  end

end
