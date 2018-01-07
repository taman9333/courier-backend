class DeliveriesController < ApplicationController
  before_action :authenticate_client!
  def create
    delivery = Delivery.new delivery_params
    byebug
    bid_id = params[:client][:bid_id]
    order_id = params[:client][:order_id]
    auction = Order.find(order_id).auctions.last
    courier = Bid.find(bid_id).courier
    order = Order.find(order_id)

    if delivery.check_order(order_id)
      if delivery.save && !delivery.check_bid(bid_id)
        auction.update_attributes(status: "closed")
        courier.notifications.create(body: "You have won the auction of #{order.client} order's - delivery_date: {order.delivery_date}")
        render json: {status:"Success", message:"Winning Courier is #{Bid.find(bid_id).courier.username}", orderStatus:"ready"}
      else
        render json: {status:"Failure", message: "This bid had been refused by Client"}
      end
    else
      render json: {status: "Failure", message: "Auction is #{auction.status},You can't create a delivery for this order"}, status: :unprocessable_entity
    end
  end



  private
  def delivery_params
    courier_id = Bid.find(params[:client][:bid_id]).courier_id
    params.require(:client).permit(:order_id).merge({courier_id: courier_id, status:"waiting_pickup"})
  end

end
