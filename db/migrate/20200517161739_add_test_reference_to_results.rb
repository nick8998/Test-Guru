class AddTestReferenceToResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :results, :test, null: false, foreign_key: true
  end
end
