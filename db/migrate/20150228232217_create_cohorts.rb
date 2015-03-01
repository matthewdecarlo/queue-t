class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.datetime :start_date

      t.timestamps
    end
  end
end
