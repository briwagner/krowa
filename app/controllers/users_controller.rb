class UsersController < ApplicationController

  def index
    @people = User.all  
    @users = []
    @people.each do |person| #this logic removes current_user from @users so user will not see him/herself from list of all users
      unless person.id == session[:user_id]
        @users << person
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/users/new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to articles_path
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end

end
