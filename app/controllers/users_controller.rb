class UsersController < ApplicationController
  
  def index
    @users = User.all
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
      flash[:success] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params) 
      flash[:success] = "You have updated your account Successfully"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def show
     @user = User.find(params[:id])
  end
  
  def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "The user was successfully deleted"
      redirect_to users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end