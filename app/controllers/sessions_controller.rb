class SessionsController < ApplicationController
    
    def new
    end


    def create
    
        user = User.find_by(name: params[:session][:name])
        
        if user
            log_in(user)
            binding.pry
            redirect_to user
        else
            flash[:danger] = "User does not exist"
            redirect_to signup_path
        end
    end
    
    
    def destroy
       log_out if logged_in?
       redirect_to root_url
    end
    
    
    
    
    
end # end class
