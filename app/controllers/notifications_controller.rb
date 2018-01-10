class NotificationsController < ApplicationController
  before_action :authenticate_client!

  def index
    notifications = @current_client.notifications.last(5).reverse
    render json:{notifications:notifications}, status: :ok
  end

  def check
    notification = Notification.find(params[:id])
    notification.update_attributes(check: true)
    notifications = @current_client.notifications.last(5).reverse
    render json:{notification:notifications}
  end

end
