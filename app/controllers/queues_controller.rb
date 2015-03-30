class QueuesController < ApplicationController
  def index
    @my_pairing_teams = current_user.teams.where(kind: "daily").order(begin_date: :desc)
    @current_teams = current_user.teams.where(kind: "weekly").where("end_date < ?", Date.today)
  end

  def new
  end

  def edit
  end

  def show
  end

  def delete
  end
end
