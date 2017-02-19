class Api::V1::UsersController < ApplicationController
  # want to add this eventually
  # before_action :require_current_user!, except: :create

  def create
    @user = User.new(user_params)

    if @user.save!
      log_in!(@user)
      render 'api/users/show.json.jbuilder'
    else
      render json: "Sorry. Display some error message here."
    end
  end

  def index
    @users = User.all

    render 'api/users/index.json.jbuilder'
  end

  def show
    @user = User.find_by(params[id])

    render 'api/users/show.json.jbuilder'
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update(user_params)
      render 'api/users/show.json.jbuilder'
    else
      render json: @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
