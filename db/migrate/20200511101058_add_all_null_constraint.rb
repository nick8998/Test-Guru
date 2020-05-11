class AddAllNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:answers, :wording, false)
    change_column_null(:categories, :title, false)
    change_column_null(:questions, :wording, false)
    change_column_null(:users, :mail, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :role, false)
  end
end
