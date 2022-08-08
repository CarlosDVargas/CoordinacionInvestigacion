class Agreement < ApplicationRecord
     belongs_to :articles
     has_many :transaction, dependent: :destroy
     validates :agreementNumber, presence: {message: 'El código del acuerdo es requerido'}, uniqueness: true
     validates :description, presence: true
end
