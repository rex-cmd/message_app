class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    def new 
    end
    def create# POST request when submit
     user= User.find_by(name: params[:session][:name]) #find the user by name in session which is created by POST
       if user && user.authenticate(params[:session][:password])#return self if password is correct
           session[:user_id]=user.id
           flash[:success]='you are successfully logged in'
           redirect_to root_path# set sessionWhat’s the difference between cookies and a session?
            #Rails will create a new record in your sessions table with a random session ID (say, 09497d46978bf6f32265fefb5cc52264).  
        else
            flash.now[:error]='There was something wrong with your login information'# to not presist the flash
            render 'new'
        end
    end
    def destroy
        session[:user_id]=nil
        flash[:success]= 'you are successfully logged out'
        redirect_to login_path
    end
    private 
    def logged_in_redirect
        if logged_in?
        flash[:error]='You are already logged in'
        redirect_to root_path
        end
    end

end