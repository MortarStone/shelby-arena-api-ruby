module ShelbyArena

  class PersonList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options = {})
      @json_data = []
      reader = options[:reader] || ShelbyArena::PersonListReader.new(options)
      data = reader.load_data['PersonListResult']['Persons']  
      unless data.nil?
        # needs to be an array of hashes.
        @json_data = data['Person'].is_a?(Array) ? data['Person'] : [data['Person']]
      end            
    end

    # Get the specified person.
    #
    # @param index The index of the person to get.
    #
    # @return [Person]
    def [](index)
      Person.new( @json_data[index] ) unless @json_data[index].nil?
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data.each{ |person| yield( Person.new(person) )}
    end
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      #@json_data['person'].empty?
      self.count == 0 ? true : false
    end

    # Access to the raw JSON data.  This method is needed for merging lists.
    #
    # @returns Raw JSON data.
    def raw_data
      @json_data
    end

  end
    
end