class ApplicationController < ActionController::API
	# require 'json_web_token'

	# def authenticate_request!
	# 	if !current_courier.present?
	# 		render json: {message: 'You must be logged in first'}, status: :unauthorized
	# 	end
	# rescue JWT::VerificationError, JWT::DecodeError
	# 	render json: {message: 'You are not Authorized'}, status: :unauthorized
	# end
	# private
	# def jwt_token
	# 	@jwt_token || = request.headers['Authentication-Token']
	# end

	# def session_info
	# 	@session_info || = JsonWebToken.decode(jwt_token)
	# end

	# def current_courier
	# 	@current_courier || = Courier.find session_info[:courier_id]
	# rescue ActiveRecord::RecordNotFound
	# 	nil	
	# end
end
