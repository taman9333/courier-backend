class ApplicationController < ActionController::API
  require 'json_web_token'

  def authenticate_request!
    if !current_client.present?
      render json: {message:'You must be authenticated first'}, status: :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: {message:'dont try again'}, status: :unauthorized
  end

  private
  def jwt_token
    # @jwt_token ||= request.headers['Authentication-Token']
    @jwt_token ||= request.headers['jwtToken']
  end

  def session_info
    @session_info ||= JsonWebToken.decode(jwt_token)
  end

  def current_client
    @current_client ||= Client.find session_info[:client_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end

end
