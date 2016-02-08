class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.text :address
      t.string :floor
      t.text :message

      t.timestamps null: false
    end
  end
end
