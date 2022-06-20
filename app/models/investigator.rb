class Investigator < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :id_card, presence: true, uniqueness: true
  validates :email, presence: true

  before_create { self.email = email.downcase }
  before_create { self.id_card = id_card.strip }

  has_many :project_investigators
  has_many :projects, through: :project_investigators

  def to_s
    "#{id_card}- #{first_name} #{last_name}"
  end
end
