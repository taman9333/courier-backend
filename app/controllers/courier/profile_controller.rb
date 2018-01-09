class Courier::ProfileController < ApplicationController
  before_action :authenticate_courier!, only: [:show, :update, :reset_password]
  # before_action :set_courier, only: [:show, :update, :reset_password]

  def show
    render json:{courier:@current_courier}
  end

  # # # PATCH/PUT /couriers/1.json
  def update (params)
      if @current_courier.update_attributes(params)
        render json: {status: "SUCCESS", message: "Your profile has been updated", courier: @current_courier}, status: :ok
      else
        render json: {status: "ERROR", error: "Your profile hasn't been updated"}, status: :unprocessable_entity
      end
  end

  # def forgot_password
    # send email
  # end

  # # what about authentication here? change pw vs email link to reset
  def reset_password (params)
    if @current_courier.authenticate(params[:password]) && params.new_password === params.new_password_conformation
      @current_courier.update_attributes(params[:password])
      render json: {status: "SUCCESS", message: "Password has been updated"}, status: :ok
    else
      render json: {status: "ERROR", message: "Wrong Password", errors:courier.errors.full_messages}, status: :wrong_password
    end
  end

  # private
    # def set_courier
    #   @courier = Courier.find(params[:id])
    # end

  # def courier_params
  #   params.require(:username, :email, :phone, :img)
  # end
  # def password_params
  #   params.require(:old_password, :new_password, :new_password_conformation)
  # end
end



