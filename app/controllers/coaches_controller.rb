class CoachesController < ApplicationController
  layout "admin", except: [:coaching_staff]

  before_action :set_coach, only: [:edit, :update, :destroy]

  def index
    @coaches = Coach.all
  end

  def coaching_staff
    @coaches = Coach.all
  end

  def new
    @coach = Coach.new
  end 

  def create
    @coach = Coach.new(coach_params)

    if @coach.save
      flash[:notice] = "The coach was created"
      redirect_to coaches_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coach.update(coach_params)
      flash[:notice] = "The coach was updated"
      redirect_to coaches_path
    else
      render :edit
    end
  end

  def destroy
    @coach.destroy
    redirect_to coaches_path
  end

  private

  def set_coach
    @coach = Coach.find(params[:id])
  end

  def coach_params
    params.require(:coach).permit(:first_name, :last_name, :title, :email, :bio)
  end
end