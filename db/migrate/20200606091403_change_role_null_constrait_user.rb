class ChangeRoleNullConstraitUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :role, true)
    change_column_null(:users, :mail, true)
  end
end
