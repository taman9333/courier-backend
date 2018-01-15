class Courier::NotificationsController < ApplicationController

  before_action :authenticate_courier!

  def index
    @notifications = @current_courier.notifications.last(5).reverse
    render :index
  end

  def check
    notification = Notification.find(params[:id])
    notification.update_attributes(check: true)
    @notifications = @current_courier.notifications.last(5).reverse
    render :check
  end

end
