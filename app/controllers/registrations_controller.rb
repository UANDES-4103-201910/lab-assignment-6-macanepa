class RegistrationsController < ApplicationController
	# skip_before_action :verify_authenticity_token
	def new
	
	end

	def create
	    #complete this method
		user = User.new(name: params[:registrations][:name],
										last_name: params[:registrations][:last_name],
										email: params[:registrations][:email],
										password: params[:registrations][:password],
										)

		if user.save
			# render json: user, status: :created, location: user
			flash[:notice] = "Registration Successful"
			redirect_to root_path
		else
			# render json: user.errors, status: :unprocessable_entity
			flash[:notice] = "Registration Error"
			redirect_to registrations_path
		end

	end

	private
		def user_params
			params.require(:user).permit(:name, :last_name, :email, :phone, :password, :address)
		end


end
