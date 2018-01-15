class Courier::ProfileController < ApplicationController
  before_action :authenticate_courier!, only: [:show, :update, :reset_password]
  # before_action :set_courier, only: [:show, :update, :reset_password]

  def show
    render json:{courier:@current_courier}
  end

  # # # PATCH/PUT /couriers/1.json
  def update
    # @courier = @current_courier
      if @current_courier.update! courier_params
        render json: {status: "SUCCESS", message: "Your profile has been updated", courier: @current_courier}, status: :ok
      else
        render json: {status: "ERROR", message: "Your profile hasn't been updated"}, status: :unprocessable_entity
      end
  end

  private

  def courier_params
      params.permit(:username, :email, :phone, :img)
  end

end


# def forgot_password
  # send email
# end

# # what about authentication here? change pw vs email link to reset
# def reset_password (params)
#   if params.new_password === params.new_password_conformation && @current_courier.update_attributes(params[:password])
#     render json: {status: "SUCCESS", message: "Password has been updated"}, status: :ok
#   else
#     render json: {status: "ERROR", message: "Wrong Password or ", errors:courier.errors.full_messages}, status: :wrong_password
#   end
# end

