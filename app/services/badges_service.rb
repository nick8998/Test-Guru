class BadgesService

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def badges
    badges = []
    Badge.select do |badge|
      if badge.achievement.classify.constantize.new(@test_passage, @current_user).check?
        badges << badge
      end
    end
    return badges
  end
end