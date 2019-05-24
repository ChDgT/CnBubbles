class AddAvailableToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :available, :boolean, default: true
  end
end
