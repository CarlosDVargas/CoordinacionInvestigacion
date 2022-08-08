class Transaction < ApplicationRecord
    has_many :trade
    enum status: [:Pendiente, :Finalizado, :En_Ejecución]

    validates :trade_id, presence: true, uniqueness: true
    validates :status, presence: true
    validates :description, presence: true
    
    after_initialize :set_default_status, if: :new_record?

    def set_default_status
        self.status ||= :Pendiente
    end

end
