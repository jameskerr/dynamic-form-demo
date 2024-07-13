class AddExpenseReferenceToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_reference :schedules, :expense, null: false, foreign_key: true
  end
end
