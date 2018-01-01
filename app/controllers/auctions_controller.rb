class AuctionsController < ApplicationController
    def open_auctions
        open_auctions = Auction.where(status: open)
        render json: open_auctions, status: :ok
    end

end
