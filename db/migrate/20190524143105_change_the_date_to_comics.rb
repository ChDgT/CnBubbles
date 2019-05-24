class ChangeTheDateToComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :publication_date, :date
  end
end
