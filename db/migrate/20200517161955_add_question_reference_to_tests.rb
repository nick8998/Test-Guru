class AddQuestionReferenceToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :test, null: true, foreign_key: true
  end
end
