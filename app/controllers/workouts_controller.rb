class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.where(:user_id => current_user[:id]).order("date")

  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new

  end

  def create
    Workout.create(agreement_id: params[:agreement_id],
                  date: params[:date],
                  time: params[:time],
                  gym_id: params[:gym_id])
    redirect_to (:back)
  end

  def edit
    @gyms = Gym.where(:user_id => current_user[:id]).where(:active => true)
    @workout = Workout.find(params[:id])
  end

  def update
    @workout=Workout.find(params[:id])
    @workout.update(date: params[:date],
                  time: params[:time],
                  gym_id: params[:gym_id],
                  client_id: @workout[:client_id],
                  user_id: @workout[:user_id])
    redirect_to "/workouts"
  end

  def destroy
    Workout.destroy(params[:id])
    redirect_to (:back)
  end
end
