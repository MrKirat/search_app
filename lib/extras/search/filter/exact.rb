# This class is responsible for exact matches.

class Search::Filter::Exact < Search::Filter
  def initialize(keyword)
    super
  end

  private

  def match?(item)
    # searchable data, for example, can look like this
    # ['IDL', 'Array', 'Interactive mode', 'David Stern']
    # Item will be included into result if any piece of
    # data includes keyword. Keyword is exact token.
    # For example, it can look like this:'Interactive mode'
    item.searchable_data.any? do |value|
      value.include? @keyword
    end
  end
end