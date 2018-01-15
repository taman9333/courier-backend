class ClientsRegistrationsController < ApplicationController
  def create
    client = Client.new client_params
    if client.save
      render json: {status: "SUCCESS", message: "You have been registered Successfully"}, status: :ok
    else
      render json: {status: "ERROR", message: "You have not been regesitered yet", errors:@client.errors.full_messages}, status: :unprocessable_entity
    end

  end

  private
  def client_params
    params.permit(:username, :email, :password, :password_confirmation, :phone, :img)
  end

end
