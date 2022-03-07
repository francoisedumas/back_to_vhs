class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    if @review.save
      redirect_to movie_path(@movie, anchor: "review-#{@review.id}")
    else
      render 'movies/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
