class Search::Item
  attr_reader :searchable_data, :object

  def initialize(object = nil, searchable_fields = nil)
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
end