class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :kind
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
