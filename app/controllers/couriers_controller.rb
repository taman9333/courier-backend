class CouriersController < ApplicationController
  before_action :authenticate_request!
  before_action :set_courier, only: [:show, :edit, :update, :destroy]

  # # GET /couriers.json only for admin
  # def index
  #   @couriers = Courier.all
  # end

  # # GET /couriers/1.json for admins and clients
  # def show
  # end

  # # PATCH/PUT /couriers/1.json
  def update
      if @courier.update(courier_params)
        render json: {status: "SUCCESS", message: "Courier has been created", courier: courier}, status: :ok
      else
        render json: {status: "ERROR", message: "Courier has not been created", errors:courier.errors.full_messages}, status: :unprocessable_entity
      end
    
  end

  # DELETE /couriers/1.json only admins
  def destroy
    @courier.destroy
    head :no_content
  end

  private
    def set_courier
      @courier = Courier.find(params[:id])
    end

    def courier_params
      params.require(:courier).permit(:username, :email, :password, :password_confirmation, :phone, :img)
    end
end
