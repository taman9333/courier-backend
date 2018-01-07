class BidsController < ApplicationController
  before_action :authenticate_courier!, only:[:create]
  before_action :authenticate_client!, only:[:reject]

  def create

    # prevCourier = Auction.find(params[:bid][:auction_id]).bids.last.courier if Auction.find(params[:bid][:auction_id]).bids.last != nil
    if Auction.find(params[:bid][:auction_id]).bids.last != nil
      prevCourier = Auction.find(params[:bid][:auction_id]).bids.last.courier
    end
    bid = @current_courier.bids.build bid_params
    if bid.save
      prevCourier.notifications.create(body:"Someone make a bid lower than yours for Order category: #{bid.auction.order.category}, Client: #{bid.auction.order.client.username}, Pickup Area: #{bid.auction.order.pickup_address.area}") if prevCourier != nil
      render json:{status:"Success", message:"Your Bid has been created Successfully", bid:bid}, status: :ok
    else
      render json:{status:"Failure", message:"Bid has not been created", errors:bid.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def reject
    bid = Bid.find(params[:bid_id])
    if bid.auction.bids.where(refused:false).length ==1
      bid.auction.update_attribute(:status, 'outdated')
    end
    bid.update_attribute(:refused, true)
    warning = "This is the last bid" if bid.auction.bids.where(refused: false).length ==1
    last_bid = bid.auction.bids.where(refused: false).last
    render json:{status:"Success", message:"Bid has been rejected", bid:bid.auction.bids.where(refused:false).last, warning:warning, auction_status:bid.auction.status, winning_courier: last_bid.try(:courier).try(:username)}
  end

  private
  def bid_params
    params.require(:bid).permit(:price, :auction_id)
  end

end
