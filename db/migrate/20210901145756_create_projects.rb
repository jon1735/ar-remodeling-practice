class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :price
      t.integer :owner_id
      t.integer :house_id
    end
  end
end
