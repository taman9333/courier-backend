class ClientsController < ApplicationController
  before_action :authenticate_request!
  
  def show
    render json:{client:@current_client}
  end

end
