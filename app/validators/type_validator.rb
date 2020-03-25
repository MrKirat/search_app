class TypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    module_name = options[:kind_of]
    if value.nil?
      record.errors.add(attribute, "can't be nil", error: :nil)
    elsif !value.kind_of? module_name
      record.errors.add(attribute, "value should be kind of #{module_name.to_s}", error: :wrong_module, expected_module: module_name.to_s)
    end
  end
end