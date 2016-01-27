class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      redirect_to '/group/new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @title = @group.name
    @group = @group.users
  end
  
  private
  def group_params
    params.require(:group).permit(:name)
  end

end