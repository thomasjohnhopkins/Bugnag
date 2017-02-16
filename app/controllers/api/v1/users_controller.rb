class Api::V1::UsersController < ApplicationController
  before_action :require_current_user!, except: :create

  def create
    @user = User.new(user_params)

    if @user.save!
      log_in!(@user)
      render :show
    else
      render json: "Sorry. Display some error message here."
    end
  end

  def index
    @users = User.all

    render :index
  end

  def show
    @user = User.find_by(params[id])

    render :show
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update(user_params)
      render :show
    else
      render json: @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
