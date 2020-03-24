module Search::Validator
  def self.validate_class(object, target_class)
    raise ArgumentError.new("#{object} must be Enumerable") unless object.is_a? target_class
  end

  def self.validate_methods(object, methods)
    methods.each do |method|
      raise ArgumentError.new("#{object} must response to #{method} method") unless object.respond_to? method.to_sym
    end
  end
end