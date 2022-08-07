class Transaction < ApplicationRecord
    has_one :arrangements
    validates :arrangementNumber, presence: true, uniqueness: true
    enum status: [:Pendiente, :Finalizado, :En_Ejecución]
    validates :status, presence: true
    
    after_initialize :set_default_status, if: :new_record?

    def set_default_status
        self.status ||= :Pendiente
    end

end
