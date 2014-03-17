module ShelbyArena
  require 'cgi'
  require 'json'

  def self.admin_request(method, params = {}, body = nil)
    url = ShelbyArena::Api.service_url
    username = ShelbyArena::Api.api_username
    password = ShelbyArena::Api.api_password

    response =
    case method
    when :post
      Typhoeus::Request.post(url, {:headers => headers, :body => body})
    when :get
      Typhoeus::Request.get(url, params: params, userpwd: username+":"+password)
    when :put
      Typhoeus::Request.put(url, {:headers => headers, :body => body})
    when :delete
      Typhoeus::Request.delete(url, {:headers => headers, :params => params})
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

end
