class Search::QueryParser
  attr_reader :keywords

  def initialize(search_string)
    prepare_search_keywords search_string
  end

  private

  def prepare_search_keywords(search_string)
    @keywords = CSV.parse_line(search_string, col_sep: ' ')
  end
end