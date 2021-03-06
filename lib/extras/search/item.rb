# Search::Item is designed to extract all needed data from object based on
# given fields' names. Then all extracted from object data will be concatenated
# into one big array. This way we can do search not depend on fields' names,
# because now all needed data are in one @searchable_data field.

class Search::Item
  attr_reader :searchable_data, :object

  def initialize(object, searchable_fields)
    validate_params(object, searchable_fields)
    @object = object
    prepare_searchable_data searchable_fields
  end

  private

  def prepare_searchable_data(searchable_fields)
    @searchable_data = []
    searchable_fields.each do |method|
      field_value = @object.send(method.to_sym)
      add_to_searchable_data field_value
    end
  end

  def add_to_searchable_data(field_value)
    if field_value.instance_of?(Array)
      @searchable_data.concat(field_value)
    else
      @searchable_data << field_value.to_s
    end
  end

  def validate_params(object, searchable_fields)
    Search::Validator.validate_class(searchable_fields, Enumerable)
    Search::Validator.validate_methods(object, searchable_fields)
  end
end