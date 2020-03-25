# This is more like "abstract" class. We can't use this
# class to create new instances. We should create
# subclasses and "override" the match? method.

class Search::Filter
  def initialize(keyword)
    @keyword = keyword.to_s
  end

  def call(searchable_items)
    validate_searchable_items(searchable_items)
    searchable_items.select do |item|
      match?(item)
    end
  end

  private

  # The match? method decides if item should stay in array or should be pulled out.
  # Each subclass should "override" this method specifically to its needs.
  def match?(item)
    raise NotImplementedError, "A subclass should override the method."
  end

  def validate_searchable_items(searchable_items)
    Search::Validator.validate_class(searchable_items, Enumerable)
  end
end