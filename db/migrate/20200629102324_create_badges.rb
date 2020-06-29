class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture, null: false
      t.boolean :all_tests, default: false
      t.boolean :test_by_one, default: false
      t.boolean :test_by_lvl, default: false

      t.timestamps
    end
  end
end
