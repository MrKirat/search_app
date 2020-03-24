class Search::Filter::Exact < Search::Filter
  def initialize(keyword)
    super
  end

  private

  def match?(item)
    item.searchable_data.any? do |value|
      value.include? @keyword
    end
  end
end