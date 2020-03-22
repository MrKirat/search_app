class CreateProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :programming_languages do |t|
      t.string :name
      # I decided to use categories column instead of type
      # to avoid problem with STI. Here are some references:
      # https://apidock.com/rails/ActiveRecord/Base/inheritance_column/class
      # https://stackoverflow.com/questions/45388539/typeerror-no-implicit-conversion-of-array-into-string-active-record-on-create
      t.text :categories, array: true, default: []
      t.text :designed_by, array: true, default: []

      t.timestamps
    end
  end
end
