class ChangeTheFormatDateToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :publication_date, :integer
  end
end
