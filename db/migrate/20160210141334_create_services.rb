class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :price
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
