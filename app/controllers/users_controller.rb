class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)
    if (user.save)
      flash[:notice] = "User Created Successful"
      redirect_to "/users/"
    else
      flash[:notice] = "Error Creating User"
      redirect_to "/users/"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      puts(user)
      flash[:notice] = "User Updated"
      redirect_to "/users/"+String(user)
    else
      flash[:notice] = "Error Updating User"
      redirect_to "/users/"+String(user)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
