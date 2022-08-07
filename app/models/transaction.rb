class Transaction < ApplicationRecord
    has_one :arrangements
    validates :arrangementNumber, presence: true, uniqueness: true
    validates :status, presence: true, length: { minimum: 0, maximum: 50 }
end
