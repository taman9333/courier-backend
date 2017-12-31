class ClientSessionsController < ApplicationController
  def create
    client = Client.find_by(email: params[:email])
    if client && client.authenticate(params[:password])
      render json: response_obj(client) , status: :ok
    else
      render json: {status: 'Error', error:'Invalid Email or Password'}, status: :unauthorized
    end
  end

  private
  def response_obj(client)
    {
      auth_token: JsonWebToken.encode({client_id: client.id}),
      client:{id:client.id, username:client.username, email:client.email, phone:client.phone}
    }
  end

end
