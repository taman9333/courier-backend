class OrdersController < ApplicationController
  def create
    order = Order.new order_params
    if order.save
      x = order.auctions.create(bid_deadline:params[:order][:bid_deadline], status:"open")
      AuctionDeadlineJob.set(wait: 1.minutes).perform_later(x)
      render json:{status: "SUCCESS", message: "Order has been created", order: order, pickup_address: order.pickup_address, drop_off_address: order.drop_off_address}, status: :ok
    else
      render json:{status: "ERROR", message: "Order has not been created", errors:order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).permit(:client_id, :category, :weight, :dimensions, :delivery_date, :billing_address, :pickup_address_id, :drop_off_address_id, pickup_address_attributes:[:apartment_number, :building_number, :street, :area, :saved, :client_id], drop_off_address_attributes:[:apartment_number, :building_number, :street, :area, :saved, :client_id])
  end


end
