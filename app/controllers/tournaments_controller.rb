class TournamentsController < ApplicationController
  layout "admin"

  before_action :set_tournament, only: [:edit, :update, :show, :destroy]

  def index
    @tournaments = Tournament.all
  end

  def show
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      flash[:notice] = "The tournament was created"
      redirect_to tournaments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      flash[:notice] = "Tournament updated"
      redirect_to tournaments_path
    else
      render :edit
    end
  end

  def destroy
    #TODO Make sure this works
    if !@tournament.games.nil?
      @tournament.games.each do |game|
        game.destroy
      end
    end
    @tournament.destroy
    redirect_to tournaments_path
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:name, :location, :start_date, :end_date)
  end
end