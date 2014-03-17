require File.expand_path( File.dirname(__FILE__) + '/../example/shelby_arena_keys.rb')
require File.expand_path( File.dirname(__FILE__) + '/../lib/shelby_arena.rb')

require 'debugger'

require 'vcr'
require 'vcr_setup'
require 'webmock/rspec'

Dir.glob(File.dirname(__FILE__) + "/factories/*").each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end


def simulate_connection_to_server
  ShelbyArena::Api.connect(ShelbyArenaKeys::USERNAME, 
                           ShelbyArenaKeys::PASSWORD,
                           ShelbyArenaKeys::API_KEY, 
                           ShelbyArenaKeys::API_SECRET, 
                           ShelbyArenaKeys::SHELBY_ARENA_SERVICE_URL)
end