class RemoveImageFileNameFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :image_file_name, :string
  end
end
