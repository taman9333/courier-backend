class Courier::SearchController < ApplicationController
  before_action :authenticate_courier!

  def filter
    x = params.keys.slice(0,3)
    obj = {}
    x.each do |item|
      if params[item].present?
        if item == 'weight'

          max = (Order.maximum(:weight).to_i + 1).to_s
          z = params[item].split('-')
          z[1] = max if z[1] == 'max'
          z = z[0]...z[1]
          obj[item] = z
        else
        obj[item] = params[item]
        end
      end
    end
    @auctions = Auction.search(where:obj).sort.reverse
    render :filter

  end

  def index
    @auctions = Auction.where(status:"open").reverse
    render :index
  end

end

# auctions = Auction.search(where:{category: , pickup: , weight: })
