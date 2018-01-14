class Courier::DeliveriesController < ApplicationController
  before_action :authenticate_courier!

  def index
    @deliveries = @current_courier.deliveries.order(created_at: :desc)
    render :index
  end

  def show
    delivery = Delivery.find(params[:id])
    if @current_courier.id == delivery.courier_id
      render json:{delivery:delivery, order:delivery.order, pickup:delivery.order.pickup_address, drop_off:delivery.order.drop_off_address, bid:delivery.order.auctions.find_by(status:"closed").bids.where(refused:false).last, client:delivery.order.client, bid_deadline:delivery.order.auctions.find_by(status:"closed").bid_deadline}, status: :ok
    else
      render json:{status:"Failure", message:"you are not authoreized to show this page"}, status: :unauthorized
    end
  end

  def update_status
    delivery = Delivery.find(params[:id])

    if delivery.courier.id != @current_courier.id
      render json:{status:"Failure", message:"You are not authorized to update this delivery"}, status: :unauthorized
    elsif delivery.status == "delivered"
      render json:{status:"Failure", message:"Your delivery has already been delivered"}, status: :unprocessable_entity
    elsif params[:status] == "enroute" || params[:status] == "delivered"
      delivery.update_attributes(status: params[:status])
      render json:{status:"Success", delivery_status:params[:status]}, status: :ok
    else
      render json:{status:"Failure", message:"You have entered a wrong status"}, status: :unprocessable_entity
    end
  end

end
