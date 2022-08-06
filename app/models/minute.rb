class Minute < ApplicationRecord
    has_one_attached :file
    has_many :articles, dependent: :destroy
end
