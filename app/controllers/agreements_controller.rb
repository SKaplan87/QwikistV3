class AgreementsController < ApplicationController
  def index
    @agreements = Agreement.where(:user_id => current_user[:id])
  end

  def show
    @agreement = Agreement.find(params[:id])
    @workouts = Workout.where(:agreement_id => params[:id] )
    @notes = Note.where(:agreement_id => params[:id] )
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
