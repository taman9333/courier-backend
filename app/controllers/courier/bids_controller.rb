class Courier::BidsController < ApplicationController
    before_action :authenticate_courier!

    def show
        # @current_auction = Orders.find(id = params.auction.id)
        # @bid = @current_auction..Bids.find(min(price))
        # render json:{bid:@bid}
    end
end
