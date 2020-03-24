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

  def match?(item)
    raise NotImplementedError, "A subclass should override the method."
  end

  def validate_searchable_items(searchable_items)
    Search::Validator.validate_class(searchable_items, Enumerable)
  end
end