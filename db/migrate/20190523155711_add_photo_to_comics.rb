class AddPhotoToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :photo, :string
  end
end
