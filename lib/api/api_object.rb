require 'virtus'

module ShelbyArena

  # This class is the base class for all ShelbyArena objects and is meant to be inherited.
  class ApiObject 
    include Virtus.model

    attr_reader :error_messages, :marked_for_destruction

    # Initializes the current object from the JSON data that was loaded into the Hash
    #
    # @param object_attributes A Hash of values to load into the current object.
    def initialize_from_json_object(object_attributes)
      if object_attributes.is_a?( Hash )
        object_attributes.each do |key, value| 
          method_to_call = "#{ShelbyArena::attr_underscore(key)}="
          
          if respond_to?(method_to_call)
            self.send(method_to_call, value) 
          else
            # debugger
            # asdf=234
            # puts "Missing :=> ".red + method_to_call.to_s  # Show the missing methods
          end
        end
      end     
    end

  end

end
