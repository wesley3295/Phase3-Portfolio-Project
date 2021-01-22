class ApplicationController < ActionController::Base

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
      end
  
      def logout
        session.clear
      end
  
    #   def redirect_if_logged_in
    #     redirect '/teams' if logged_in?
    #   end
end
