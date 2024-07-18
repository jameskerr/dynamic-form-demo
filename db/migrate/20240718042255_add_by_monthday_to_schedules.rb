class AddByMonthdayToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :by_monthday, :string
  end
end
