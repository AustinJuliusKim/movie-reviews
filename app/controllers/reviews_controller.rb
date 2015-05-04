class ReviewsController < ApplicationController
	def create
		@movie = Movie.find(params[:id])
		# retrieves the movie object to which the new review will belong
		@review = @movie.reviews.new(review_params)
		# create our new review through the movie object 
		@review.reviewer = Reviewer.find_or_create_by(email: params[:review][:reviewer_attributes][:email]) do |reviewer|
			reviewer.name = params[:review][:reviewer_attributes][:name]
		end
		# creates reviewer object, only if there is no reviewer with the same email address in the database
		@review.save
		
		redirect_to movie_path(@movie)
	end

	private

	def review_params
		params.require(:review).permit(:body, :score, reviewer_attriutes: [:name, :email])
	end
end
