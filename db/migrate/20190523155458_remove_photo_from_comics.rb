class RemovePhotoFromComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :photo, :string
  end
end
