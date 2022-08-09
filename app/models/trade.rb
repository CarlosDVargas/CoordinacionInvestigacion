class Trade < ApplicationRecord
    validates :trade_id, presence: {message: 'El número del oficio es requerido'}
    belongs_to :transactions
    has_one_attached :file
end
