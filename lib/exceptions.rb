module ShelbyArenaExceptions
  class UnableToConnectToShelbyArena < StandardError; end
  class UnknownErrorConnectingToShelbyArena< StandardError; end
  class ShelbyArenaResponseError < StandardError; end
end