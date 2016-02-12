class RemoveImageUpdatedAtFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :image_updated_at, :datetime
  end
end
