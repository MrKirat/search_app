# This module contains the main logic of the search.

# TODO: add validations

class Search
  def initialize(objects_for_search, fields_for_search)
    prepare_searchable_items(objects_for_search, fields_for_search)
  end

  def find_by_string(search_string)
    search_keywords = Search::QueryParser.new(search_string).keywords
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
end
