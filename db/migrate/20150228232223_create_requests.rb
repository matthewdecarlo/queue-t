class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :requestable

      t.timestamps
    end
  end
end
