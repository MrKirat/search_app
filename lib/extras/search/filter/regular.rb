# This class is responsible for regular matches.

class Search::Filter::Regular < Search::Filter
  def initialize(keyword)
    super
  end

  private

  def match?(item)
    # searchable data, for example, can look like this
    # ['IDL', 'Array', 'Interactive mode', 'David Stern']
    # Item will be included into result if any piece of
    # data equals to keyword. Matches are whole-word and
    # non-case-sensitive. Keyword is regular token.
    # For example, it can look like this: 'interactive'
    item.searchable_data.any? do |value|
      value.split(' ').any? do |part|
        part.downcase == @keyword.downcase
      end
    end
  end
end