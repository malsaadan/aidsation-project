class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :description
      t.string :req_type

      t.timestamps
    end
  end
end
