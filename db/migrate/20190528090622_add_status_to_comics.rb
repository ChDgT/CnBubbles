class AddStatusToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :status, :string, default: "Available"
  end
end
