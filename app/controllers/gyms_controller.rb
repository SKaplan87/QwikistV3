class GymsController < ApplicationController
  def index
    @gyms = Gym.where(:user_id => current_user[:id]).where(:active => true)

  end

  def show
    @gym = Gym.find(params[:id])
    @workouts = Workout.where(:gym_id => params[:id] ).order("date")
    @count = Workout.where(:gym_id => params[:id] ).count
    revenue=0
    @workouts.each do |wk|
      rev = wk.agreement[:fee]
      revenue = revenue + rev
    end
    @revenue=revenue
    @profit = @revenue-(@count*@gym[:fee])
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
