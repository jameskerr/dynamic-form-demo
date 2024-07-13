class Schedule < ApplicationRecord
  belongs_to :expense
  monetize :amount_cents
  
  validates :amount, :interval, :frequency, presence: true
end
