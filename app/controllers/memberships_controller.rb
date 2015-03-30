class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all

    @all_memberships = Membership.group(:team_id).pluck(:team_id)
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new({member: current_user})
  end

  def edit
    @membership = Membership.find(params[:id])
  end
end
