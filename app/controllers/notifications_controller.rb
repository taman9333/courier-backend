class NotificationsController < ApplicationController
  before_action :authenticate_client!

  def index
    @notifications = @current_client.notifications.last(5).reverse
    render :index
  end

  def check
    notification = Notification.find(params[:id])
    notification.update_attributes(check: true)
    @notifications = @current_client.notifications.last(5).reverse
    render :check
  end

end
