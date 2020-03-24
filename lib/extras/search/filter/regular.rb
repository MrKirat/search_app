class Search::Filter::Regular < Search::Filter
  def initialize(keyword)
    super
  end

  private

  def match?(item)
    item.searchable_data.any? do |value|
      value.split(' ').any? do |part|
        part.downcase == @keyword.downcase
      end
    end
  end
end