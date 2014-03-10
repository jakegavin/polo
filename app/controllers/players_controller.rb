class PlayersController < ApplicationController
  layout "admin", except: [:roster]

  def index
    @teams = Team.all
    @unassigned_players = Player.where(team_id: nil)
  end

  def roster
    @teams = Team.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:notice] = "Player created."
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      flash[:notice] = "Player updated."
      redirect_to players_path
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private 

  def player_params
    params.require(:player).permit(:first_name, :last_name, :number, :position, :grad_year, :team_id)
  end
end