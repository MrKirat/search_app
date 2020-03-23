# This module contains the main logic of the search.
#   Just include it and specify. searchable fields to use it.
#   Example:
#
#   class YourModel
#     include Searchable
#     set_searchable_fields :name, :categories, :designed_by
#   end
#
# There is only one limitation, singleton class should
# have the all method which returns all instances of that class.
# Fortunately, ActiveRecord has this method by default :)

# TODO: split this large file into more then one
# TODO: add validations
# TODO: refactor the code

module Searchable
  extend ActiveSupport::Concern

  included do
    @search_query = SearchQuery.new('')
    # here is the usage of the all method
    @search_collection = SearchItemCollection.new(all, [])
  end

  module ClassMethods
    def search_collection
      @search_collection
    end

    def search_query
      @search_query
    end

    def set_searchable_fields(*args)
      # here is the one more usage of the all method
      @search_collection = SearchItemCollection.new(all, args)
    end

    def search(search_string)
      @search_query = SearchQuery.new(search_string)
      SearchMatchFinder.new(self).matches
    end
  end

  class SearchMatchFinder
    attr_reader :matches

    def initialize(searchable_instance)
      @searchable_instance = searchable_instance
      calculate_matches
    end

    private

    def calculate_matches
      @matches = []
      required_matches_count = @searchable_instance.search_query.keywords.count

      @searchable_instance.search_collection.items.each do |item|
        found_matches_count = 0

        item.searchable_data.each do |searchable_item|
          @searchable_instance.search_query.keywords.each do |searchable_keyword|
            found_matches_count += 1 if has_match?(searchable_item, searchable_keyword)
          end
        end

        @matches.push item.object if required_matches_count == found_matches_count
      end
    end

    def has_match?(item, keyword)
      item.to_s.downcase.include?(keyword.to_s.downcase)
    end
  end

  class SearchQuery
    attr_reader :keywords, :string

    def initialize(search_string)
      @string = search_string
      prepare_search_keywords
    end

    private

    def prepare_search_keywords
      @keywords = CSV.parse_line(@string, col_sep: ' ')
    end
  end

  class SearchItemCollection
    attr_reader :items, :objects, :searchable_fields

    def initialize(objects = [], searchable_fields = [])
      @objects = objects
      @searchable_fields = searchable_fields
      prepare_items
    end

    def prepare_items
      @items = []
      @objects.each do |search_object|
        item = SearchItem.new(search_object, @searchable_fields)
        @items.push item
      end
    end
  end

  class SearchItem
    attr_reader :searchable_fields, :object, :searchable_data

    def initialize(object = nil, searchable_fields = nil)
      @object = object
      @searchable_fields = searchable_fields
      prepare_search_data_array
    end

    private

    def prepare_search_data_array
      @searchable_data = []
      @searchable_fields.each do |method|
        field_value = @object.send(method.to_sym)
        field_value.instance_of?(Array) ?
          @searchable_data.concat(field_value) :
          @searchable_data << field_value.to_s
      end
    end
  end
end