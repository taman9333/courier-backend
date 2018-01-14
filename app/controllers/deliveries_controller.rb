class DeliveriesController < ApplicationController
  before_action :authenticate_client!
  def create
    delivery = Delivery.new delivery_params
    bid_id = params[:client][:bid_id]
    order_id = params[:client][:order_id]
    auction = Order.find(order_id).auctions.last
    courier = Bid.find(bid_id).courier
    order = Order.find(order_id)

    if delivery.check_order(order_id)
      if delivery.save && !delivery.check_bid(bid_id)
        auction.update_attributes(status: "closed")
        z = courier.notifications.create(body: "You have won the auction of Order No. #{order.id}", auction_id:auction.id)
        ActionCable.server.broadcast "courier_notifications:#{courier.id}", {notification: z, delivery_id: Delivery.last.id}
        render json: {status:"Success", message:"Winning Courier is #{Bid.find(bid_id).courier.username}", orderStatus:"ready"}
      else
        render json: {status:"Failure", message: "This bid had been refused by Client"}
      end
    else
      render json: {status: "Failure", message: "Auction is #{auction.status},You can't create a delivery for this order"}, status: :unprocessable_entity
    end
  end


  def index
    @deliveries = Delivery.joins(:order).where(:orders => {:client_id=>@current_client.id}).order(created_at: :desc)
    render :index
  end

  def show
    delivery = Delivery.find(params[:id])
    render json:{order:delivery.order, pickup:delivery.order.pickup_address, drop_off:delivery.order.drop_off_address, delivery:delivery, courier:delivery.courier.username, price:delivery.order.auctions.find_by(status:"closed").bids.where(refused:false).last.price}, status: :ok
  end

  def update
    delivery = Delivery.find(params[:id])
    delivery.update_attributes(review: params[:review], rating:params[:rating])
    render json:{status:"Success", delivery:delivery}, status: :ok
  end

  private
  def delivery_params
    courier_id = Bid.find(params[:client][:bid_id]).courier_id
    params.require(:client).permit(:order_id).merge({courier_id: courier_id, status:"waiting_pickup"})
  end

end
