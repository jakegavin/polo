class TeamsController < ApplicationController
  layout "admin"

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:notice] = "Team created"
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      flash[:notice] = "Team Updated"
      redirect_to teams_path
    else 
      render :edit   
    end   
  end

  def destroy
    @team = Team.find(params[:id])
    @team.players.each do |player|
      player.team = nil
      player.save
    end
    @team.destroy
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end