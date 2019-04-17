class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    if (cookies["logged_user"]!=nil)
      user_id = User.find(cookies["logged_user"]).id
      return user_id
    end
    return nil
  end

  def is_user_logged_in?
	#complete this method
  logged_in = false
    if(current_user!=nil)
      # puts("Cookie exists!\n\n\n")
      logged_in = true
    end

	if logged_in then true else redirect_to root_path end 
  end
end
