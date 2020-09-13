class Client < ApplicationRecord
  has_many :cases, dependent: :restrict_with_error
  has_many :lawyers, through: :cases
  has_many :courts, through: :cases
end
