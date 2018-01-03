class AuctionsController < ApplicationController
    before_action :authenticate_courier!
    
    def filtered_open_auctions
        @filtered_open_auctions = Orders.where(auction.status: open && pickup_address.area === params.pickup_area && drop_off_address.area === params.drop_off_area && weight === params.weight )
        render json: @filtered_open_auctions, status: :ok
    end

    def show
        @auction = Order.find session_info[:client_id]
        rescue ActiveRecord::RecordNotFound
            nil
        end
        render json:@auction, status: :ok
    end

end


# open_auctions = Orders.where(Auctions.status: open)
# open_auctions = open_auctions.filter(params.slice(:category, :weight))
# open_auctions = open_auctions.pickup_address.filter(params.slice(:pickup_area)
# @filtered_open_auctions = open_auctions.drop_off_address.filter(params.slice(:drop_off_area)

# @filtered_open_auctions = Order.where(Auction.status: open).filter(params.slice(:category, :weight)).pickup_address.filter(params.slice(:pickup_area).drop_off_address.filter(params.slice(:drop_off_area)

# open_auctions = Orders.where(auction.status: open).filter(params.slice(:category, :weight))
# area = params.pickup_area
# pickup_address = Orders.where(pickup_address.area.filter(:area))
# area = params.drop_off_area
# drop_off_address = Orders.where(pickup_address.area.filter(:area))
# @filtered_open_auctions = open_auctions.where(pickup_address === pickup_address && drop_off_address === drop_off_address)

# open_auctions.filter(params.category)
# open_auctions.filter(params.slice(:category, :pickup_area, :drop_off_area, :weight))