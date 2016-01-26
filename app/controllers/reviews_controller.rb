class ReviewsController < ApplicationController
 
	before_action :find_review, only: [:show]
	def new
		@review = Review.new
		@game = Game.find(params[:game_id])
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @review }
			format.js
		end
	end

	def show
		@rewiew = Review.find(params[:id])
	end

	def create
	  @review = current_user.reviews.build(params_review)
	  @game = Game.find(params[:game_id])
	  @review.game = @game
	  respond_to do |format|
	    if @review.save
	      format.html { redirect_to @game }
	      format.json { render json: @review, status: :created, location: @game }
	      format.js

	    else
	      format.html { render action: "new" }
	      format.json { render json: @review.errors, status: :unprocessable_entity }
	      format.js
	    end
	  end
	end

	private

	def params_review
		params.require(:review).permit(:rating, :description, :game_id)
	end

	def find_review
		@review = Review.find(params[:id])
	end


end