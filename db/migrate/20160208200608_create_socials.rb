class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :facebook
      t.string :phone

      t.timestamps null: false
    end
  end
end
