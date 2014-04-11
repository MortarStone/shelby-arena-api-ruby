# *******************************************
# This is a demo file to show usage.
#
# @package ShelbyArenaApi
# ******************************************* 

require 'debugger'

require File.dirname(__FILE__) + '/../lib/shelby_arena.rb'

require File.dirname(__FILE__) + '/shelby_arena_keys.rb'

shelby_session = ShelbyArena::Api.request_session(ShelbyArenaKeys::USERNAME, 
                                                  ShelbyArenaKeys::PASSWORD, 
                                                  ShelbyArenaKeys::API_KEY, 
                                                  ShelbyArenaKeys::SHELBY_ARENA_SERVICE_URL)


ShelbyArena::Api.connect(shelby_session.id, 
                         ShelbyArenaKeys::API_SECRET, 
                         ShelbyArenaKeys::SHELBY_ARENA_SERVICE_URL)

person_list = ShelbyArena::PersonList.new({campus_id: 3})
person = person_list[0]

debugger
asdf=234

# puts '*****************'
# puts person_list.inspect
# puts '*****************'
# puts '*****************'

# person = ShelbyArena::Person.load_by_id(person.person_id)

# puts '*****************'
# puts person.inspect
# puts '*****************'
# puts '*****************'
