class GymsController < ApplicationController
  def index
    @gyms = Gym.where(:user_id => current_user[:id]).where(:active => true)
  end

  def show
    @gym = Gym.find(params[:id])
    @workouts = Workout.where(:gym_id => params[:id] )
  end

  def new
  end

  def create
    Gym.create(name: params[:name],
                address: params[:address],
                bio: params[:bio],
                fee: params[:fee],
                user_id: current_user[:id])
    redirect_to "/gyms"
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym=Gym.find(params[:id])
    @gym.update(name: params[:name],
                  address: params[:address],
                  bio: params[:bio],
                  fee: params[:fee])
    redirect_to "/gyms"
  end

  def destroy
  end
end
