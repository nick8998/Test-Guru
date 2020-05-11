class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :wording
      t.integer :sublevel

      t.timestamps
    end
  end
end
