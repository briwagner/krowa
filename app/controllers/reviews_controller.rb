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

	def edit
		@review = Review.find(params[:id])
		@game = Game.find(params[:game_id])
	end

	def update
	  @game = Game.find(params[:game_id])
      @review = Review.find(params[:id])
      if @review.update(params_review)
        redirect_to @game
      else
        @errors = @review.errors.full_messages
        render 'new'
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


	def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @game = Game.find(params[:game_id])

    respond_to do |format|
      format.html { redirect_to @game }
      format.json { head :no_content }
      format.js
    end
  end

	private

	def params_review
		params.require(:review).permit(:rating, :description)
	end

	def find_review
		@review = Review.find(params[:id])
	end


end