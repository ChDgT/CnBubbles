class AddPriceToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :price, :integer
  end
end
