class RemoveImageFileSizeFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :image_file_size, :integer
  end
end
