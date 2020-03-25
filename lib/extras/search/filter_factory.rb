# This factory was developed to create different filters based on givem token.
# Token can looks like the following:
#
# --array - negative token
#   Basic - regular token
#  "Thomas Johnson" - exact token

module Search::FilterFactory
  extend self

  def generate_from_string(string)
    case
    when string.include?(QUOTE)
      Search::Filter::Exact.new(remove_symbol(string, QUOTE))
    when string.start_with?(MINUS)
      Search::Filter::Negative.new(remove_symbol(string, MINUS))
    else
      Search::Filter::Regular.new(string)
    end
  end

  private

  QUOTE = '"'
  MINUS = '--'

  def remove_symbol(string, symbol)
    string.gsub(symbol, '')
  end
end