class SearchProgrammingLanguages
  include Interactor

  SEARCHABLE_FIELDS = :name, :categories, :designed_by

  def call
    if context.search_string.blank?
      context.result = ProgrammingLanguage.all
    else
      context.result =
        Search
          .new(ProgrammingLanguage.all, SEARCHABLE_FIELDS)
          .find_by_string(context.search_string)
    end
  end
end