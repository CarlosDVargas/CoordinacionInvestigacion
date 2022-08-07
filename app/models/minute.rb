class Minute < ApplicationRecord
    has_one_attached :file
    has_many :articles, dependent: :destroy
     accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |attr| attr["number"].blank? }
end
