class Courier::RegistrationsController < ApplicationController
    # before_action :downcase_email
    
    def create
        @courier = Courier.new courier_params

        if @courier.save
            render json: {status: "SUCCESS", message: "You're account has been created Successfully. Please check the confirmation link in your email."}, status: :ok
             #Invoke send email method here
        else
            render json: {status: "ERROR", message: "You have not been regesitered yet", errors:courier.errors.full_messages}, status: :unprocessable_entity
        end

    end

    private

    def courier_params
      params.require(:courier).permit(:username, :email, :password, :password_confirmation, :phone, :img)
    end

    # def downcase_email
    #     courier_params.email = courier_params.email.delete(' ').downcase
    # end

end

  
  