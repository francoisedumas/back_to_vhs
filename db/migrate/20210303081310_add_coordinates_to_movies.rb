class AddCoordinatesToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :latitude, :float
    add_column :movies, :longitude, :float
  end
end
