class ReviewsController < ApplicationController
 
	before_action :find_review, only: [:show]
	def new
		@review = Review.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @review }
			format.js
		end
	end

	def show
	end

	def create
	  # params[:review][:rating].to_i
	  # params[:review][:game_id] = 5
	  @review = current_user.reviews.build(params_review)

	  respond_to do |format|
	    if @review.save
	      # format.html { redirect_to @review, notice: 'review was successfully created.' }
	      # format.json { render json: @review, status: :created, location: @review }
	      # format.js
	      redirect_to '/games'
	    else
	      format.html { render action: "new" }
	      format.json { render json: @review.errors, status: :unprocessable_entity }
	      format.js
	    end
	  end
	end

	private

	def params_review
		params.require(:review).permit(:rating, :description)
	end

	def find_review
		@rewiew = Review.find(params[:id])
	end


end