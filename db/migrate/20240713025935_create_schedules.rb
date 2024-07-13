class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.integer :amount_cents
      t.integer :interval
      t.string :frequency
      t.boolean :repeats
      t.datetime :started_at

      t.timestamps
    end
  end
end
