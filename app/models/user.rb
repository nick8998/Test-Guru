class User < ApplicationRecord
  def find_all_tests_by_lvl(level)
    self.class.joins('JOIN tests ON users.tests = tests.title and tests.level = ?', level)
    #self.class
      #.select('users.tests tests.level tests.title')
      #.joins(:tests)
      #.where('tests.level == ?', level)
  end
end
