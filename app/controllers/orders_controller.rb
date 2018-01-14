class OrdersController < ApplicationController

  before_action :authenticate_client!, only:[:create]
  before_action :authenticate_request!, only:[:show]
  before_action :authenticate_client!, only:[:index]

  def create
    order = Order.new order_params
    if order.save!
      x = order.auctions.create!(bid_deadline:params[:order][:bid_deadline], status:"open")
      AuctionDeadlineJob.set(wait: 10.minutes).perform_later(x, order)
      render json:{status: "SUCCESS", message: "Order has been created", order_id:order.id, order: order, pickup_address: order.pickup_address, drop_off_address: order.drop_off_address}, status: :ok
    else
      render json:{status: "ERROR", message: "Order has not been created", errors:order.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def show

    order = Order.find(params[:id])
    if @current_client != nil
      if @current_client.id != order.client.id
        render json:{Status: "Failure", message: "You are not authorized"}, status: :unauthorized
        return
      else
        # auction = order.auctions.find_by(status:"open")
        auction = order.auctions.last
        bid =  auction.bids.where(refused: false).last
        warning = "This is the last bid" if auction.bids.where(refused: false).length ==1
        render json:{status: "SUCCESS", order:order, last_bid: bid , pickup_address: order.pickup_address, drop_off_address: order.drop_off_address,winning_courier: bid.try(:courier).try(:username) , auction:auction, warning:warning}, status: :ok
        return
      end
    end

    if order.auctions.find_by(status:"open").present?
      auction = order.auctions.find_by(status:"open")
      render json:{status: "SUCCESS", order:order, last_bid: auction.bids.last , pickup_address: order.pickup_address, drop_off_address: order.drop_off_address,winning_courier: auction.bids.last.try(:courier).try(:username) , auction:auction}, status: :ok
    else
      render json:{status: "Failure", message:"Order you are requesting had been closed"}, status: :unprocessable_entity
    end
  end

  def index
    @orders = @current_client.orders.reverse
    render :index
  end

  private
  def order_params
    params.require(:order).permit(:client_id, :category, :weight, :dimensions, :delivery_date, :billing_address, :pickup_address_id, :drop_off_address_id, pickup_address_attributes:[:apartment_number, :building_number, :street, :area, :saved, :client_id], drop_off_address_attributes:[:apartment_number, :building_number, :street, :area, :saved, :client_id])
  end


end
