class RemoveImageContentTypeFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :image_content_type, :string
  end
end
