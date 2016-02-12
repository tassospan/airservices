class AddImageLinkToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :image_link, :string
  end
end
