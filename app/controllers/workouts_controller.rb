class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.where(:user_id => current_user[:id]).order("date")
    @count = Workout.where(:user_id => current_user[:id]).count
    revenue = 0
    fees = 0
    @workouts.each do |wk|
      rev = wk.agreement[:fee]
      revenue = revenue + rev
      fee = wk.gym[:fee]
      fees = fees + fee
    end
    @revenue = revenue
    @profit = @revenue-fees
        if @profit < 9325
      @estimatedTaxes = @profit*0.1
    elsif @profit < 37950
      @estimatedTaxes = 932.50 + @profit*0.15
    elsif @profit < 37950
      @estimatedTaxes = 932.50 + @profit*0.15
    elsif @profit < 91900
      @estimatedTaxes = 5226.25 + @profit*0.25
    elsif @profit < 191650
      @estimatedTaxes = 18713.75 + @profit*0.28
    end
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
