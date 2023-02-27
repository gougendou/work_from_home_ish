class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.float :price
      t.string :address
      t.string :photo
      t.text :description
      t.boolean :booking_status

      t.timestamps
    end
  end
end
