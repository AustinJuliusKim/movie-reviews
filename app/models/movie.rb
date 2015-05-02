class Movie < ActiveRecord::Base
	has_many  :reviews

	def average_score
		if self.reviews.count > 0
			self.reviews.where.not(score: nil).average("score")
		else
			"This movie hasn't been scored yet."
		end
	end
end
