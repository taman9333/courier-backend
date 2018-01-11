module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    require 'json_web_token'

    def connect
      self.current_user = find_verified_user
    end

    protected

    def session_info
  		@session_info ||= JsonWebToken.decode(request.params[:token])
  	end

    def find_verified_user
      
      if session_info[:courier_id]
        current_user = Courier.find(session_info[:courier_id])
      elsif session_info[:client_id]
        current_user = Client.find(session_info[:client_id])
      else
        reject_unauthorized_connection
      end
    end

  end
end
