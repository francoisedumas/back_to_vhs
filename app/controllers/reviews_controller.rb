class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@movie, anchor: "review-#{@review.id}") }
        format.json
      else
        format.html { render 'movies/show' }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
