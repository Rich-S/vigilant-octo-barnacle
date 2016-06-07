class UsersController < ApplicationController
  
  respond_to :js,:json,:html 
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to projects_url
    #respond_to do |format|
    #  format.html { redirect_to projects_url }
    #end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: 'success' }
    else  
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash.now[:notice] = "#{user.name} was removed."
  end

  def new
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
