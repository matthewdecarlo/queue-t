class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :quirk, :string
    add_column :users, :cohort_id, :integer
    add_column :users, :role, :string
  end
end
