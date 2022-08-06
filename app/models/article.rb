class Article < ApplicationRecord
  belongs_to :minute
  belongs_to :project 
end
