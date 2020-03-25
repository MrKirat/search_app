#This class was developed to return all matched objects based on given filters.

class Search::MatchFinder
  attr_reader :matches

  def initialize(searchable_items, filters)
    validate_params(searchable_items, filters)
    @searchable_items = searchable_items
    @filters = filters
    prepare_matches
  end

  private

  def prepare_matches
    searchable_items = @searchable_items

    @filters.each do |filter|
      searchable_items = filter.call searchable_items
    end

    @matches = searchable_items.map { |item| item.object }
  end

  def validate_params(searchable_items, filters)
    Search::Validator.validate_class(searchable_items, Enumerable)
    Search::Validator.validate_class(filters, Enumerable)
  end
end
