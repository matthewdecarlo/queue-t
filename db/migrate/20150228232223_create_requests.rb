class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :requestable, polymorphic: true, index: true
      t.string :title

      t.timestamps
    end
  end
end
