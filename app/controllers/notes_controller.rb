class NotesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    Note.create(agreement_id: params[:agreement_id],
              date: Date.today,
              content: params[:content])
    redirect_to (:back)
  end

  def edit
  end

  def update
  end

  def destroy
    Note.destroy(params[:id])
    redirect_to (:back)
  end
end
