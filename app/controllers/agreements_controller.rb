class AgreementsController < ApplicationController

  before_action :authenticate_user!

  def index
    @agreements = Agreement.where(:user_id => current_user[:id]).where(:active => true)
    @workouts = Workout.where(:user_id => current_user[:id])
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
    @agreement = Agreement.find(params[:id])
    @workouts = Workout.where(:agreement_id => params[:id] ).order("date")
    @notes = Note.where(:agreement_id => params[:id] ).order("date")
    @gyms = Gym.where(:user_id => current_user[:id])
    @count = Workout.where(:agreement_id => params[:id] ).count
    @revenue = @count*@agreement[:fee]
    fees = 0
    @workouts.each do |wk|
      fee = wk.gym[:fee]
      fees = fees + fee
    end
    @profit = @revenue-fees

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
    @agreement=Agreement.find(params[:id])
    @agreement.update(playlist: params[:playlist])
    redirect_to (:back)
  end

  def destroy
  end
end
