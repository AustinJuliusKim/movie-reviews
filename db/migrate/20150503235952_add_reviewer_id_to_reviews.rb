class AddReviewerIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :reviewer, index: true, foreign_key: true
  end
end
