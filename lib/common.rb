module ShelbyArena

  def self.request_session
    response = Typhoeus::Request.post(ShelbyArena::Api.service_url+'/login', {body: {username: ShelbyArena::Api.username, password: ShelbyArena::Api.password, api_key: ShelbyArena::Api.api_key}})
    raise ShelbyArenaExceptions::UnableToConnectToShelbyArena.new(response.body) unless response.success?
    self._xml2json(response.body)
  end


  def self.api_request(method, path, params = {}, body = nil)
    url = [ShelbyArena::Api.service_url, path].join('/')
    mparams = params.merge({api_session: ShelbyArena::Api.session_key})
    mparams = mparams.merge({api_sig: self._generate_api_signature(path, params)})

    response =
    case method
    when :post
      raise 'Shelby POST not tested yet'
      #Typhoeus::Request.post(url, {:headers => headers, :body => body})
    when :get
      Typhoeus::Request.get(url, params: mparams)
    when :put
      raise 'Shelby PUT not tested yet'
      # Typhoeus::Request.put(url, {:headers => headers, :body => body})
    when :delete
      raise 'Shelby DELETE not tested yet'
      # Typhoeus::Request.delete(url, {:headers => headers, :params => params})
    end    
    
    if !response.success?
      if response.code > 0
        raise ShelbyArenaExceptions::UnableToConnectToShelbyArena.new(response.body)
      else
        begin
          error_messages = JSON.parse(response.body)['error_message']
        rescue
          response_code_desc = response.headers.partition("\r\n")[0].sub(/^\S+/, '') rescue nil
          raise ShelbyArenaExceptions::UnknownErrorConnectingToShelbyArena.new("Unknown error when connecting to Shelby Arena.#{response_code_desc}")
        else
          raise ShelbyArenaExceptions::ShelbyArenaResponseError.new(error_messages)
        end
      end
    end   
    
    response
  end  


  def self._xml2json(xml)
    # {KeepRoot: true, ForceArray: false, SuppressEmpty: true} were set to 
    # maximize compatibility with Hash.from_xml, used previously.
    #
    XmlSimple.xml_in(xml, {KeepRoot: true, ForceArray: false, SuppressEmpty: true})
  end  


  def self._generate_api_signature(path, params)
    get_vars = ''
    if params.to_a.size > 0
      get_vars = '?' + params.to_a.sort.collect { |kv_pair| "#{kv_pair[0]}=#{kv_pair[1].to_s}" }.join('&').downcase
    end
    utoken = get_vars.empty? ? '?' : '&'
    Digest::MD5.hexdigest("#{ShelbyArena::Api.api_secret}_#{path.downcase}#{get_vars}#{utoken}api_session=#{ShelbyArena::Api.session_key}")
  end


  # This is a helper method
  def self.attr_underscore(str)
    str.gsub(/::/, '/')
       .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
       .gsub(/([a-z\d])([A-Z])/,'\1_\2')
       .tr("-", "_")
       .downcase
  end    
end
