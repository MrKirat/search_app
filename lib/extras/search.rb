# This module contains the main logic of the search.

class Search
  def initialize(searchable_objects, searchable_fields)
    validate_params(searchable_objects)
    prepare_searchable_items(searchable_objects, searchable_fields)
  end

  def find_by_string(search_string)
    search_keywords = Search::QueryParser.new(search_string.to_s).tokens
    Search::MatchFinder.new(@items, search_keywords).matches
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