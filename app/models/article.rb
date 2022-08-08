class Article < ApplicationRecord
  belongs_to :minute
  belongs_to :project
  validates :number, presence: true, uniqueness: true
  validates :project_id, presence: true
end
