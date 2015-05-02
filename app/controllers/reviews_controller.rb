class ReviewsController < ApplicationController
	def create
		@movie = Movie.find(params[:id])
		# retrieves the movie object to which the new review will belong
		@review = @movie.reviews.new(params.require(:review).permit(:body))
		@review.save
		# create our new review through the movie object and saves the new review
		redirect_to movie_path(@movie)
	end
end
