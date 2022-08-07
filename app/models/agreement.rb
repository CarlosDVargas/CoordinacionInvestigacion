class Agreement < ApplicationRecord
     #has_one :articles
     #has_many :transaction
     validates :agreementNumber, presence: true, uniqueness: true
     #validates :articleNumber, presence: true
end
