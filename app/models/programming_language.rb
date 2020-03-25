# This model contain all data from provided JSON.
class ProgrammingLanguage < ApplicationRecord
  validates :name, presence: true
  validates :categories, type: {kind_of: Enumerable}
  validates :designed_by, type: {kind_of: Enumerable}
end
