class User < ApplicationRecord
  def find_tests_by_lvl(level)
    tests = Test.where(level: level)
    Result.where(self.class.id: tests.id)
  end
end
