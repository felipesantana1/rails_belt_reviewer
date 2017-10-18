class MessagesController < ApplicationController

    def create
        message = Message.new(content:params[:message], event:Event.find(params[:event_id]), user:User.find(session[:user_id]))
        if message.valid?
            message.save
            redirect_to "/events/#{params[:event_id]}"
        else
            flash[:errors] = message.errors.full_messages
            redirect_to "/events/#{params[:event_id]}"
        end
    end
end
