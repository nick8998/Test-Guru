module AnswersHelper

  def result_procent
    @test_passage.correct_questions*100/@test_passage.test.questions.count
  end

  def question_number
    @test_passage.test.question_ids.index(@test_passage.current_question.id) + 1
  end
end
