class ClientsController < ApplicationController
  before_action :authenticate_client!

  def show
    render json:{client:@current_client}
  end

  def update
      if @current_client.update! client_params
        render json: {status: "SUCCESS", message: "Your profile has been updated", client: @current_client}, status: :ok
      else
        render json: {status: "ERROR", message: "Your profile hasn't been updated"}, status: :unprocessable_entity
      end
  end

  private

  def client_params
      params.permit(:username, :email, :phone, :img)
  end

end
