class ClientsController < ApplicationController
  def index
    @clients = Client.where(:user_id => current_user[:id]).where(:active => true)
  end

  def show
  end

  def new
  end

  def create
        Client.create(name: params[:name],
              address: params[:address],
              email: params[:email],
              img: params[:image],
              user_id: current_user[:id])
    redirect_to "/clients"
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client=Client.find(params[:id])
    @client.update(name: params[:name],
                  address: params[:address],
                  email: params[:email],
                  img: params[:img])
    redirect_to "/clients"
  end

  def destroy

  end
end
