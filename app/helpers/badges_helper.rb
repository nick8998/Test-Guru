module BadgesHelper
  def badge_rules
    Rules::ALLRULES.map { |rule| [t("badges.rules.#{rule}"), rule]}
  end
end
