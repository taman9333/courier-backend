class Courier::SessionsController < ApplicationController
  def create
    @courier = Courier.find_by email: params[:email]
    if @courier && @courier.authenticate(params[:password])
      render json: response_obj(@courier), status: :ok
    else
      render json: {status: 'ERROR', error:'Invalid email/password'}, status: :unauthorized
    end
  end

  private
  def response_obj(courier)
    {
      # status: 'Success',
      auth_token: JsonWebToken.encode({courier_id: courier.id}),
      courier:{id:courier.id, username:courier.username, email:courier.email, phone:courier.phone, img:courier.img}
    }
  end

end
