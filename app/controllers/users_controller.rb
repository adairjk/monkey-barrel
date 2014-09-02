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
end
