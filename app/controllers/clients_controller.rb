class ClientsController < ApplicationController
  before_action :authenticate_client!

  def show
    render json:{client:@current_client}
  end

end
