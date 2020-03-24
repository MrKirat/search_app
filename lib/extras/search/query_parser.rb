class Search::QueryParser
  attr_reader :tokens

  def initialize(search_string)
    prepare_search_keywords search_string.to_s
  end

  private

  SEARCH_TOKEN_REGEX = /"[^"]*"|[^ ,"!?]+/

  def prepare_search_keywords(search_string)
    @tokens = search_string.scan(SEARCH_TOKEN_REGEX).map do |token|
      remove_symbol(token, '"')
    end
  end

  def remove_symbol(string, symbols_to_remove)
    string.gsub(symbols_to_remove, "")
  end
end