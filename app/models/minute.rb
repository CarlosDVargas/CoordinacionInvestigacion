class Minute < ApplicationRecord
    validates :number, presence: {message: 'El número del acta es requerido'}, uniqueness: true
    validates :date, presence: {message: 'Es necesario indicar la fecha del acta'} 

    has_one_attached :file
    has_many :articles, dependent: :destroy
    accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |attr| attr["number"].blank? }
end
