module QuestionsHelper

  def question_header(test, source)
    if source == "edit"
      "Edit #{test.title} Question"
    elsif source == "new"
      "Create New #{test.title} Question"
    end
  end

end
