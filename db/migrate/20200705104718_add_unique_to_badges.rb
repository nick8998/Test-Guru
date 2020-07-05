class AddUniqueToBadges < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, [:achievement, :options], unique: true
  end
end
