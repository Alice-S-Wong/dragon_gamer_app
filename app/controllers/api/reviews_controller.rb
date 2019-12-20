class Api::ReviewsController < ApplicationController
  def create
    if current_user
      @review = Review.new(
        user_id: current_user.id,
        game_id: params[:game_id],
        rating: params[:rating],
        review: params[:review]
      )
      @review.save
      render "show.json.jb"
    else
      render json: {message: "Must be logged in to create a review"}, status: :unauthorized
    end
  end
end
