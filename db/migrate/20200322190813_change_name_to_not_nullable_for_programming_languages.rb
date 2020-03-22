class ChangeNameToNotNullableForProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    change_column_null :programming_languages, :name, false
  end
end
