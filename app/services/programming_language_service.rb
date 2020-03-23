# This service developed to maintain business logic
module ProgrammingLanguageService
  def self.search(search_string)
    search_string.present? ? ProgrammingLanguage.search(search_string) : ProgrammingLanguage.all
  end
end