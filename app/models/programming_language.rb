# This is our model which. This model contain all data from provided JSON.
# TODO: add validations
class ProgrammingLanguage < ApplicationRecord
  include Searchable
  set_searchable_fields :name, :categories, :designed_by
end
