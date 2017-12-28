class CourierRegistrationsController < ApplicationController
    # before_action :downcase_email
    
    def create
        @courier = Courier.new courier_params

        if @courier.save
            render json: {status: "SUCCESS", message: "Courier has been created", courier: @courier}, status: :ok
             #Invoke send email method here
        else
            render json: {status: "ERROR", message: "Courier has not been created", errors:@courier.errors.full_messages}, status: :unprocessable_entity
        end

    end

    private
    # def downcase_email
    #     .email = self.email.delete(' ').downcase
    # end

    def courier_params
      params.require(:courier).permit(:username, :email, :password, :password_confirmation, :phone, :img)
    end
end
