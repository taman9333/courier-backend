class Courier::DeliveriesController < ApplicationController
  before_action :authenticate_courier!

  def index
    @deliveries = @current_courier.deliveries
    render :index
  end

  def show
    delivery = Delivery.find(params[:id])
    if @current_courier.id == delivery.courier_id
      render json:{delivery:delivery, order:delivery.order, pickup:delivery.order.pickup_address, drop_off:delivery.order.drop_off_address, bid:delivery.order.auctions.find_by(status:"closed").bids.where(refused:false).last, client:delivery.order.client}, status: :ok
    else
      render json:{status:"Failure", message:"you are not authoreized to show this page"}, status: :unprocessable_entity
    end
  end

end
