# This class is responsible for negative matches.

class Search::Filter::Negative < Search::Filter
  def initialize(keyword)
    super
  end

  private

  def match?(item)
    # searchable data, for example, can look like this
    # ['IDL', 'Array', 'Interactive mode', 'David Stern']
    # Item will be removed from result array if any piece of
    # data equals to keyword. Matches are whole-word nad
    # non-case-sensitive. Keyword is negative token.
    # For example, it can look like this: 'interactive'
    !item.searchable_data.any? do |value|
      value.split(' ').any? do |part|
        part.downcase == @keyword.downcase
      end
    end
  end
end