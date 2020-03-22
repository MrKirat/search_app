# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Let's fill DB with data provided in JSON file
PROGRAMMING_LANGUAGES_LOCATION = "seeds/programming_languages.json"
ARRAY_KEYS = [:categories, :designed_by]
NEW_COLUMN_NAMES = {:type => :categories}

if ProgrammingLanguage.count.zero?
  path = File.join(File.dirname(__FILE__), PROGRAMMING_LANGUAGES_LOCATION)
  languages = JSON.parse(File.read(path))

  languages.each do |language|
    prepared_params = language.to_a.map do |pair|
      key = pair.first.downcase.parameterize(separator: '_').to_sym
      key = NEW_COLUMN_NAMES.fetch(key, key)

      value = pair.last
      value = value.split(',').map(&:strip) if ARRAY_KEYS.include?(key)

      [key, value]
    end.to_h

    ProgrammingLanguage.create!(prepared_params)
  end

  puts "Programming languages are seeded"
end