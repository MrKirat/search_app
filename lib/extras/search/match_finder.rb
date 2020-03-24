class Search::MatchFinder
  attr_reader :matches

  def initialize(searchable_items, keywords)
    @searchable_items = searchable_items
    @keywords = keywords
    prepare_matches
  end

  private

  def prepare_matches
    @matches = []
    required_matches_count = @keywords.count

    @searchable_items.each do |item|
      @matches.push item.object if required_matches_count == found_matches_count(item)
    end
  end

  def found_matches_count(item)
    found_matches_count = 0

    item.searchable_data.each do |searchable_item|
      @keywords.each do |searchable_keyword|
        found_matches_count += 1 if match?(searchable_item, searchable_keyword)
      end
    end

    found_matches_count
  end

  def match?(item, keyword)
    item.to_s.downcase.include?(keyword.to_s.downcase)
  end
end
