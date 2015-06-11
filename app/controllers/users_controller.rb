class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            flash.now[:danger] = "Signup did not work. Try again"
            render 'new'
        end
        
    end
    
    def show
        @user = User.find(params[:id])
        @previous_events = @user.previous_events
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email)
    end
    
    
    
    
end
