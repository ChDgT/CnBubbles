class RemoveAvailableFromComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :available, :boolean
  end
end
