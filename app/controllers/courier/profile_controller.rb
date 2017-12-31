class Courier::ProfileController < ApplicationController
  before_action :authenticate_request!, only: [:show, :update, :reset_password]
  # before_action :set_courier, only: [:show, :update, :reset_password]

  def show
  end

  # # PATCH/PUT /couriers/1.json
  def update
      if @current_courier.update(courier_params)
        render json: {status: "SUCCESS", message: "Courier has been updated", courier: courier}, status: :ok
      else
        render json: {status: "ERROR", message: "Courier has not been updated", errors:courier.errors.full_messages}, status: :unprocessable_entity
      end
  end

  # def forgot_password
    
  # end

  # what about authentication here? change pw vs email link to reset
  def reset_password(courier_params)
    if @old_password == @current_courier.password && @new_password == @new_password_conformation
      @current_courier.password = @new_password
      render json: {status: "SUCCESS", message: "Password has been updated", courier: courier}, status: :ok
    else
      render json: {status: "ERROR", message: "Wrong Password", errors:courier.errors.full_messages}, status: :wrong_password
    end
    end
  end

  private
    # def set_courier
    #   @courier = Courier.find(params[:id])
    # end

    def courier_params
      params.require(:old_password, :new_password, :new_password_conformation, :courier).permit(:username, :email, :password, :password_confirmation, :phone, :img)
    end
end

