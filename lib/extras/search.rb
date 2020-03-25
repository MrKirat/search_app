# This module contains the logic of the search functionality.
# As params we should pass array of searchable objects and names
# of their fields where search module should look for matches.

class Search
  def initialize(searchable_objects, searchable_fields)
    validate_params(searchable_objects)
    prepare_searchable_items(searchable_objects, searchable_fields)
  end

  def find_by_string(search_string)
    search_filters = Search::Query.new(search_string.to_s).filters
    Search::MatchFinder.new(@items, search_filters).matches
  end

  private

  def prepare_searchable_items(searchable_objects, searchable_fields)
    @items = []
    searchable_objects.each do |search_object|
      item = Search::Item.new(search_object, searchable_fields)
      @items.push item
    end
  end

  def validate_params(searchable_objects)
    Validator.validate_class(searchable_objects, Enumerable)
  end
end