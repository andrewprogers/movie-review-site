class AddPosterToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :imdbID, :string
    add_column :movies, :poster, :string
  end
end
