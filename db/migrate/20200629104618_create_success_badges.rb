class CreateSuccessBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :success_badges do |t|
      t.references :user, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
