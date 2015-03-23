class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :requestable
      t.string :title
      
      t.timestamps
    end
  end
end
