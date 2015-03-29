class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @all_students = User.student
    @members = @team.members

    @all_kinds = Team.kinds   # ["daily", "weekly", "long-term"]
    @kinds = []
    @kinds = params[:kind][:ids] if params[:kinds]
  end

  def edit
    @team = Team.new
    @all_students = User.student
    @members = @team.members


    @all_kinds = Team.kinds   # ["daily", "weekly", "long-term"]
    @kinds = []
    @kinds = params[:kind][:ids] if params[:kinds]
  end

  def create
    team_attr = team_params
    team_attr["kind"] = kind_params
    
    @team = Team.new(team_attr)
    
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts member_params
    # member_params[:ids].each{ |v| puts v unless v.length == 0 }
    member_params[:ids].each { |value| @team.members << User.find(value) unless value.length == 0 }
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :kind, :begin_date, :end_date, :user)
    end

    def member_params
      params.require(:member)
    end

    def kind_params
      params.require(:kind)
    end
end
