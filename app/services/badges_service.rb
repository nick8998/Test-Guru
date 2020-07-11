class BadgesService

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def badges
    Badge.select do |badge|
      badge.achievement.classify.constantize.new(@test_passage, @current_user).check?
    end
  end
end