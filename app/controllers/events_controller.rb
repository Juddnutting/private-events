class EventsController < ApplicationController
    
    
    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:success] = "Event created!"
            redirect_to root_url
        else
            flash.now[:danger] = "there was a problem"
            render 'new'
        end
        
    end
    
    def index
        @events = Event.all
    end
    
    def show
        @event = Event.find(params[:id])
    
    end
    
    private
        
        def event_params
            params.require(:event).permit(:title, :description, :date)
        end
    
end
