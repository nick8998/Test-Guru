class CreateTestTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :test_timers do |t|
      t.integer :hours, null: false, default: 0
      t.integer :minutes, null: false, default: 0
      t.integer :seconds, null: false, default: 0
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
