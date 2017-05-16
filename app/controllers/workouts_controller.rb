class WorkoutsController < ApplicationController
  def index
    @workouts=Workout.all
  end

  def show
    @workouts = Workout.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
