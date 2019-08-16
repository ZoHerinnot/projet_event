class EventsController < ApplicationController

  def show
    @event=Event.find(params[:id].to_i)
  end

  def update
  end

  def edit
  end

  def index
    @event = Event.all
  end

  def new
    @event =Event.new
  end
  def create

    if user_signed_in?
    
   event_params = params.require(:event).permit(:start_date,:title,:duration,:location,:price,:description,:admin_id)
   @event = Event.new(event_params)
   @event.admin_id = current_user.id
   @event.save
   redirect_to events_path

    else
  redirect_to new_user_session_path
  end
  

  end
  def method_name
    

  @event=Event.new(
      admin_id: params[:admin_id].to_i,
      start_date: params[:start_date],
      title: params[:title],
      duration: params[:duration].to_i,
      location: params[:location],
      price: params[:price].to_i,
      description: params[:description]
      
      )
    if user_signed_in?
       

      @event.save
      puts "#"*60
      puts params.inspect 
      puts  @event.save
      puts "#"*60
    
      redirect_to events_path

    else
      redirect_to new_user_session_path
    end
    
  end
end