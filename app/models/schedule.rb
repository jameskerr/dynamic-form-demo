module Int
  module_function

  def parse(string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end
end


class Schedule < ApplicationRecord
  belongs_to :expense
  monetize :amount_cents
  
  serialize :by_monthday, type: Array, coder: JSON
  normalizes :by_monthday, with: -> field { field.map{|n| Int.parse(n)}.compact }
  
  validates :amount, :interval, :frequency, presence: true

  def interval
    super || 1
  end

  def amount_cents
    super || 0
  end
end
