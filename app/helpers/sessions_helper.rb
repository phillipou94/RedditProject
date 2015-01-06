module SessionsHelper

	def log_in(user)
		session[:user_id]=user.id
	end 

   # Returns the current logged-in user (if any).
   def current_user
      #if we can successfully assign a user_id based on the session
      if (user_id = session[:user_id])
         #then have currentUser is currentUser exists
         #but if not find current user by its id
         @current_user ||= User.find_by(id: session[:user_id])
         #@current_user = current_user if it exists
         #= User.find_by(id:session[:user_id]) if it doesn't exist

      #if we couldn't assign it by session, assign user id by the cookie (persistent)
      elsif (user_id = cookies.signed[:user_id])
         user = User.find_by(id: user_id)
         if user && user.authenticated?(:remember, cookies[:remember_token])
            log_in user
            @current_user = user
         end
      end

   end

   def current_user?(user)
      user==current_user
   end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end 

	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id]=user.id
		cookies.permanent[:remember_token] = user.remember_token
	end 

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end 


end
