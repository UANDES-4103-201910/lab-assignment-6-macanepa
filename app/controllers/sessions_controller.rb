class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		input_email = params[:session][:email]
		input_password = params[:session][:password]

		user = User.where(email:input_email,password: input_password)[0]
		if(user!=nil)
			puts(user.id)
			flash[:notice] = "Login Successful"
			puts("Redirecting TO:")
			puts("/users/" +String(user.id))
			cookies['logged_user'] = String(user.id)
			redirect_to "/users/" +String(user.id)
		else
			flash[:notice] = "User or Password Incorrect"
			redirect_to root_path
		end




	end

	def destroy
		cookies["logged_user"] = nil
		puts("Logged Out")
	end
end
