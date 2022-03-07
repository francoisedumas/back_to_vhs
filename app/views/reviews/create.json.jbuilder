if @review.persisted?
  json.form json.partial!("reviews/form.html.erb", movie: @movie, review: Review.new)
  json.inserted_item json.partial!("movies/review.html.erb", review: @review)
else
  json.form json.partial!("reviews/form.html.erb", movie: @movie, review: @review)
end
