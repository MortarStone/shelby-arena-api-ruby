module ShelbyArena

  class ContributionList

    include Enumerable

    # attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options = {})
      reader = options[:reader] || ShelbyArena::ContributionListReader.new(options)        
      @json_data = if reader.load_data['ContributionListResult']['Contributions'].nil?
        []
      else
        reader.load_data['ContributionListResult']['Contributions']['Contribution']
      end
    end

    # Get the specified contribution.
    #
    # @param index The index of the contribution to get.
    #
    # @return Contribution
    def [](index)
      Contribution.new( @json_data[index] ) unless @json_data[index].nil?
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data.each{ |contribution| yield( Contribution.new(contribution) )}
    end

    # Alias the count method
    alias :size :count


    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      self.count == 0 ? true : false
    end

  end
  
end
