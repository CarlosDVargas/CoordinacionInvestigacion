class Investigator < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :id_card, presence: true, uniqueness: true
    validates :email, presence: true

    before_create { self.email = email.downcase }
end
