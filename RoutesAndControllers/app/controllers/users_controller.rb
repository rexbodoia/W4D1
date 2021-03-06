class UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
  
  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422 
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user
      @user.delete
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422 
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end

