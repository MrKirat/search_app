# This class is developed to split string that user types into search input on
# index page view into separate tokens. After splitting, Search::FilterFactory
# will generate different filters based on given tokens.

class Search::Query
  attr_reader :filters

  def initialize(search_string)
    prepare_search_tokens search_string.to_s
  end

  private

  TOKEN_REGEX = /"[^"]*"|[^ ,"!?]+/
  TOKEN_VALIDATION_REGEX = /.*[a-zA-Z0-9].*/

  def prepare_search_tokens(search_string)
    @filters = []
    search_string.scan(TOKEN_REGEX).each do |token|
      add_filter(token)
    end
  end

  def add_filter(token)
    @filters.push Search::FilterFactory.generate_from_string(token) if token_valid?(token)
  end

  def token_valid?(token)
    token.match? TOKEN_VALIDATION_REGEX
  end
end