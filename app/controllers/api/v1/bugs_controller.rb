class Api::V1::BugsController < ApplicationController

  def create
    @bug = Bug.new(bug_params)

    if @bug.save!
      render 'api/bugs/show.json.jbuilder'
    else
      render json: "Sorry. Display some error message here."
    end
  end

  def index
    @bugs = Bug.all

    render 'api/bugs/index.json.jbuilder'
  end

  def show
    @bug = Bug.find_by(params[id])

    render 'api/bugs/show.json.jbuilder'
  end

  def update
    @bug = Bug.find_by_id(params[:id])

    if @bug.update(bug_params)
      render 'api/bugs/show.json.jbuilder'
    else
      render json: @bug.errors.full_messages
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :body, :bug_id)
  end
end
