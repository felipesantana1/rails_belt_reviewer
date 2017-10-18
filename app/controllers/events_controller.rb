class EventsController < ApplicationController
  def home
    @user = User.find(session[:user_id])
    @in_state_events = Event.all.where(state:current_user.state)
    @out_of_state_events = Event.all.where.not(state:current_user.state)
  end

  def create
    event = Event.new(name:params[:name], date:params[:date], location:params[:location], state:params[:state], user:User.find(session[:user_id]))
    if event.valid?
      event.save
      redirect_to '/events'
    else
      flash[:errors] = event.errors.full_messages
      redirect_to '/events'
    end
  end

  def show
    @event = Event.find(params[:event_id])
    @joins = Join.all.where(event:Event.find(params[:event_id]))
    @messages = Message.all.where(event:Event.find(params[:event_id]))
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def update
    event = Event.find(params[:event_id])
    event.name = params[:name]
    event.date = params[:date]
    event.location = params[:location]
    event.state = params[:state]
    if event.valid?
      event.save
      redirect_to '/events'
    else
      flash[:errors] = event.errors.full_messages
      redirect_to "/events/#{event.id}/edit"
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    event.destroy
    redirect_to "/events"
  end
end
