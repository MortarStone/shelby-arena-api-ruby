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

contribution_list = ShelbyArena::ContributionList.new
contribution = contribution_list[0]

# debugger
# asdf=111

# puts '*****************'
# puts person_list.inspect
# puts '*****************'
# puts '*****************'

contribution2 = ShelbyArena::Contribution.load_by_id(contribution.contribution_id)

debugger
asdf=222

# puts '*****************'
# puts person.inspect
# puts '*****************'
# puts '*****************'
