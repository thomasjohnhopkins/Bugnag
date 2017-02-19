class Api::V1::BugsController < ApplicationController
  before_action :require_current_bug!, except: :create

  def create
    @bug = Bug.new(bug_params)

    if @bug.save!
      log_in!(@bug)
      render :show
    else
      render json: "Sorry. Display some error message here."
    end
  end

  def index
    @bugs = Bug.all

    render :index
  end

  def show
    @bug = Bug.find_by(params[id])

    render :show
  end

  def update
    @bug = Bug.find_by_id(params[:id])

    if @bug.update(bug_params)
      render :show
    else
      render json: @bug.errors.full_messages
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :body, :bug_id)
  end
end
