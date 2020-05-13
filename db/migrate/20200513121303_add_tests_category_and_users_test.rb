class AddTestsCategoryAndUsersTest < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      t.string :category
    end

    change_table :users do |t|
      t.string :tests
    end
  end
end
