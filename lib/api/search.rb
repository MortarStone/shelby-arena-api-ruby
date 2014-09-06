module ShelbyArena

  class Search

    def self.search_for_contributions_by_date_range(start_date, end_date, page=1, per_page=100)
      options = {from_date: start_date, to_date: end_date, page_index: page, page_size: per_page}
      reader = ShelbyArena::ContributionListReader.new(options)
      ContributionList.new({reader: reader})
    end       

    def self.search_for_contributions_by_person(first_name, last_name, page=1, per_page=100)
      options = {first_name: first_name, last_name: last_name, page_index: page, page_size: per_page}
      reader = ShelbyArena::ContributionListReader.new(options)
      ContributionList.new({reader: reader})
    end       

  end

end
