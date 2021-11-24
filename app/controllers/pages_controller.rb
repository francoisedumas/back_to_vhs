class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @movies = Movie.all

    @movies_selection = @movies.select{ |movie| movie.release_year.between?(1990,1999)}.first(6)

    @markers = @movies.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
