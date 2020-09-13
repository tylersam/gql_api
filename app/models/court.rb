class Court < ApplicationRecord
  has_many :cases, dependent: :restrict_with_error
  has_many :lawyers, through: :cases
  has_many :clients, through: :cases
end
