class Case < ApplicationRecord
  belongs_to :lawyer
  belongs_to :client
  belongs_to :court

  enum status: { ongoing: 0, won: 1, lost: 2 }
end
