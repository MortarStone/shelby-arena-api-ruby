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
                                                  ShelbyArenaKeys::CONTRIBUTION_API_KEY, 
                                                  ShelbyArenaKeys::SHELBY_ARENA_SERVICE_URL)

ShelbyArena::Api.connect(shelby_session.id, 
                         ShelbyArenaKeys::CONTRIBUTION_API_SECRET, 
                         ShelbyArenaKeys::SHELBY_ARENA_SERVICE_URL)

contribution_list = ShelbyArena::Search.search_for_contributions_by_date_range('2012-01-01', '2014-05-15')

# debugger
# asdf=111

puts '*****************'
puts contribution_list.inspect
puts '*****************'
puts '*****************'


contribution_list2 = ShelbyArena::Search.search_for_contributions_by_person('Grace','Phillips')

# debugger
# asdf=222

puts '*****************'
puts contribution_list2.inspect
puts '*****************'
puts '*****************'

