class User < ApplicationRecord
  def find_tests_by_lvl(level)
    Test.joins("INNER JOIN results ON tests.id = results.tests_id").where(tests: { level: level }, results: { users_id: id})
  end
end
