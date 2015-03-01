class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :member_id
      t.references :group_id

      t.timestamps
    end
  end
end
