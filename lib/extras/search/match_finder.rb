class Search::MatchFinder
  attr_reader :matches

  def initialize(searchable_items, search_keywords)
    validate_params(searchable_items, search_keywords)
    @searchable_items = searchable_items
    @search_keywords = search_keywords
    prepare_matches
  end

  private

  def prepare_matches
    @matches = []
    required_matches_count = @search_keywords.count

    @searchable_items.each do |item|
      @matches.push item.object if required_matches_count <= found_matches_count(item)
    end
  end

  def found_matches_count(item)
    found_matches_count = 0

    item.searchable_data.each do |searchable_item|
      @search_keywords.each do |search_keyword|
        found_matches_count += 1 if match?(searchable_item, search_keyword)
      end
    end

    found_matches_count
  end

  def match?(item, search_keyword)
    item.to_s.downcase.include?(search_keyword.to_s.downcase)
  end

  def validate_params(searchable_items, search_keywords)
    Search::Validator.validate_class(searchable_items, Enumerable)
    Search::Validator.validate_class(search_keywords, Enumerable)
  end
end
