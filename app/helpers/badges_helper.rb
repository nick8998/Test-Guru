module BadgesHelper

  def options_for_select(badge_rules)
    collection = []
    badge_rules.each do |rule, value|
      collection << [value, rule]
    end 
    return collection
  end
end
