module ShelbyArena

  class FundList

    include Enumerable

    # attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options = {})
      @json_data = []
      reader = options[:reader] || ShelbyArena::FundListReader.new(options)  
      data = reader.load_data['FundListResult']['Funds']   
      unless data.nil?
        # needs to be an array of hashes.
        @json_data = data['Fund'].is_a?(Array) ? data['Fund'] : [data['Fund']]
      end      
    end

    # Get the specified fund.
    #
    # @param index The index of the fund to get.
    #
    # @return Fund
    def [](index)
      Fund.new( @json_data[index] ) unless @json_data[index].nil?
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data.each{ |fund| yield( Fund.new(fund) )}
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
