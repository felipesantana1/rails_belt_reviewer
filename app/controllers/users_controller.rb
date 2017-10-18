class UsersController < ApplicationController

  def index
  end

  def create
    user = User.new(name:params[:name], username:params[:username], email:params[:email], location:params[:location], state:params[:state], password:params[:password], password_confirmation:params[:password_confirmation])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to '/events'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def login
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/events'
    else
      flash[:log_errors] = "Invalid Combination"
      redirect_to '/'
    end
  end

  def edit
  end

  def update
    user = User.find(session[:user_id])
    user.name = params[:name]
    user.username = params[:username]
    user.email = params[:email]
    user.location = params[:location]
    if user.valid?
      user.save
      redirect_to '/events'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/user/#{user.id}"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
end
