class Rules 

  ALLRULES = { :category_test_rule => I18n.t('.category_test_rule'), 
               :level_rule => I18n.t('.level_rule'), 
               :one_try_rule => I18n.t('.one_try_rule'), }.freeze

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end
end