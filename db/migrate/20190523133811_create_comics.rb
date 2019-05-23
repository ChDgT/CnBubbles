class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :description
      t.string :category
      t.date :publication_date
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
