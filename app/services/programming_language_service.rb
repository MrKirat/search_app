# This service developed to maintain business logic
module ProgrammingLanguageService
  SEARCHABLE_FIELDS = :name, :categories, :designed_by

  def self.search(search_string)
    return ProgrammingLanguage.all if search_string.blank?
    Search.new(ProgrammingLanguage.all, SEARCHABLE_FIELDS).find_by_string(search_string)
  end
end