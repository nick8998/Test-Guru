class AddAnswerReferenceToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :questions, null: false, foreign_key: true
  end
end
