class AddressesController < ApplicationController
  before_action :authenticate_client!

  def index
    render json:{addresses:@current_client.addresses.where(saved:true), client_id:@current_client.id}
  end

end
