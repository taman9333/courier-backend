class AuctionsController < ApplicationController
    before_action :authenticate_courier!

    def open_auctions
        open_auctions = Auction.where(status: open)
        render json: open_auctions, status: :ok
    end

end
