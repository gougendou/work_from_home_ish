class AddUseridToWorkplaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :workspaces, :user, foreign_key: true
  end
end
