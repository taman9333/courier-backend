class Courier::AuctionsController < ApplicationController
    before_action :authenticate_courier!

    def filter_open_auctions
        
        # @filtered_open_auctions = 
        # render json: @filtered_open_auctions, status: :ok
    end

end  

