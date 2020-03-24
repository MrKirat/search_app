class SearchProgrammingLanguages
  include Interactor

  SEARCHABLE_FIELDS = :name, :categories, :designed_by

  def call
    context.result =
      if context.search_string.blank?
        ProgrammingLanguage.all
      else
        Search
          .new(ProgrammingLanguage.all, SEARCHABLE_FIELDS)
          .find_by_string(context.search_string)
      end
  end
end