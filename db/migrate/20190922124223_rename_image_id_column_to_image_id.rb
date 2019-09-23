class RenameImageIdColumnToImageId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :books, :ImageId, :image_id
  end
end
