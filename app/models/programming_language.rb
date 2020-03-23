class ProgrammingLanguage < ApplicationRecord
  include Searchable
  set_searchable_fields :name, :categories, :designed_by
end
