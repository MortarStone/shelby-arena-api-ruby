module ShelbyArena

  class Search

    def self.search_for_contributions_by_date_range(start_date, end_date)
      options = {from_date: start_date, to_date: end_date}
      reader = ShelbyArena::ContributionListReader.new(options)
      ContributionList.new({reader: reader})
    end       

    def self.search_for_contributions_by_person(first_name, last_name)
      options = {first_name: first_name, last_name: last_name}
      reader = ShelbyArena::ContributionListReader.new(options)
      ContributionList.new({reader: reader})
    end       

  end

end
