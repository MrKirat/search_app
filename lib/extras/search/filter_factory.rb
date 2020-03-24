module Search::FilterFactory
  extend self

  def generate_from_string(string)
    case
    when with_quotes?(string)
      Search::Filter::Exact.new(remove_quotes string)
    when with_minuses?(string)
      Search::Filter::Negative.new(remove_minuses string)
    else
      Search::Filter::Regular.new(string)
    end
  end

  private

  QUOTE = '"'
  MINUS = '--'

  def with_quotes?(string)
    string.include? QUOTE
  end

  def with_minuses?(string)
    string.start_with? MINUS
  end

  def remove_quotes(string)
    replace_symbol(string, QUOTE, '')
  end

  def remove_minuses(string)
    replace_symbol(string, MINUS, '')
  end

  def replace_symbol(string, old_val, new_val)
    string.gsub(old_val, new_val)
  end
end