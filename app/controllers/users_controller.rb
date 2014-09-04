class UsersController < ApplicationController

  def index
    @users = User.all
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
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => "New user created successfully"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "User has been updated"
    else
      redirect_to users_path, :alert => "Error up dating user information"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if User.destroy(params[:id])
      redirect_to users_path, :notice => 'User has been deleted'
    end
  end

  def user_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end

  def add_tag
    @user = User.find(params[:id])
    @user.tag_list.add(params[:tag])
    if @user.save
      redirect_to users_path, :notice => "Tags have been updated successfully"
    else
      redirect_to users_path, :alert => "Error updating tags"
    end
  end

  def remove_tag
    @user = User.find(params[:id])
    @user.tag_list.remove(params[:tag])
    if @user.save
      redirect_to users_path, :notice => "Tags have been updated successfully"
    else
      redirect_to users_path, :alert => "Error updating tags"
    end
  end
end
