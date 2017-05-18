class AgreementsController < ApplicationController
  def index
    @agreements = Agreement.where(:user_id => current_user[:id]).where(:active => true)
  end

  def show
    @agreement = Agreement.find(params[:id])
    @workouts = Workout.where(:agreement_id => params[:id] )
    @notes = Note.where(:agreement_id => params[:id] )
    @gyms = Gym.where(:user_id => current_user[:id])
    @revenue = (Workout.where(:agreement_id => params[:id] ).count)*@agreement[:fee]
  end

  def new
    @clients=Client.where(:user_id => current_user[:id])
  end

  def create
    Agreement.create(client_id: params[:client],
                fee: params[:fee],
                user_id: current_user[:id])
    redirect_to "/agreements"
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
