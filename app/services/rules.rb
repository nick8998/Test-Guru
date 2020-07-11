class Rules 

  ALLRULES = [:category_test_rule, :level_rule, :one_try_rule].freeze

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end


end