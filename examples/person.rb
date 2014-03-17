# *******************************************
# This is a demo file to show usage.
#
# @package ShelbyArenaApi
# ******************************************* 

require File.dirname(__FILE__) + '/../lib/shelby_arena.rb'

require File.dirname(__FILE__) + '/shelby_arena_keys.rb'

ShelbyArena::Api.connect(ShelbyArenaKeys::USERNAME, 
                         ShelbyArenaKeys::PASSWORD,
                         ShelbyArenaKeys::API_KEY, 
                         ShelbyArenaKeys::API_SECRET, 
                         ShelbyArenaKeys::SHELBY_ARENA_SERVICE_URL)

person_list = ShelbyArena::PersonList.new

puts '*****************'
puts person_list.inspect
puts '*****************'
puts '*****************'

person = ShelbyArena::Person.load_by_id(person_list[0])

puts '*****************'
puts person.inspect
puts '*****************'
puts '*****************'
