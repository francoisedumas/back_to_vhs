class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    if @review.save
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
