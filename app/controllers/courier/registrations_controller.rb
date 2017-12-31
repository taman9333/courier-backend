class Courier::RegistrationsController < ApplicationController
    before_action :downcase_email
    
    def create(courier_params)
        @courier = Courier.new courier_params

        if @courier.save
            render json: {status: "SUCCESS", message: "Courier has been created", courier: @courier}, status: :ok
             #Invoke send email method here
        else
            render json: {status: "ERROR", message: "Courier has not been created", errors:@courier.errors.full_messages}, status: :unauthorized
        end

    end

    private

    def courier_params
      params.require(:courier).permit(:username, :email, :password, :password_confirmation, :phone, :img)
    end

    def downcase_email
        courier_params.email = courier_params.email.delete(' ').downcase
    end

end
