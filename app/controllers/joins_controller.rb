class JoinsController < ApplicationController

    def create
        Join.create(user:User.find(session[:user_id]), event:Event.find(params[:event_id]))
        redirect_to '/events'
    end

    def destroy
        join = Join.all.where(user:User.find(session[:user_id]), event:Event.find(params[:event_id]))
        join.destroy(join)
        redirect_to "/events"
    end
end
