
module ShelbyArena

  # This class is the base class for all ShelbyArena objects and is meant to be inherited.
  class ApiReader
    attr_reader :headers 

    # Loads the data.
    #
    # @return the data loaded in a JSON object.
    def load_data
      @url_data_params ||= {}
      return _load_data(@url_data_path, @url_data_params)
    end

    private

    def _load_data(url_data_path, url_data_params)
      response = ShelbyArena::api_request(:get, url_data_path, url_data_params)
      @headers = response.headers
      ShelbyArena::_xml2json(response.body)
    end

  end

end