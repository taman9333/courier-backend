class AuctionsController < ApplicationController
    before_action :authenticate_courier!

    def index_orders_with_open_auctions
        @open_auctions = Order.where(auction.status: open)
        render json:{open_auctions:  @open_auctions}
    end

    def filter_open_auctions
        @filtered_open_auctions = @open_auctions.where(pickup_address.area: filter_params.pickup_area && drop_off_address.area: filter_params.drop_off_area).filter(filter_params.slice(:category, :weight))
        rescue ActiveRecord::RecordNotFound
            nil
        end
        @auction_cards_details = @filtered_open_auctions.map {|n| {id: n.id, category: n.category, delivery_date: n.delivery_date, bid_deadline: n.bid_deadline}}
        render json: {@auction_cards_details}, status: :ok
    end

    # def show_auction
    #     @order = Order.find(auction_params.id)
    #     rescue ActiveRecord::RecordNotFound
    #         nil
    #     end
    #     render json:{auction:@order}
    # end
    
    private
    # def auction_params
    #   params.require(:auction).permit(:id)
    # end
    def filter_params
        params.require(:filters).permit(:pickup_area, :drop_off_area, :weight, :category)
    end
end

