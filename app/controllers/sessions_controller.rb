class SessionsController < ApplicationController
    def new 
    end
    def create# POST request when submit
        user=User.find_by(name: params[:session][:name])#find the user by name in session which is created by POST
        if user && user.athenticate(params[:session][:password])#return self if password is correct
            session[:user_id]=user.id
            # set sessionWhat’s the difference between cookies and a session?
            #Rails will create a new record in your sessions table with a random session ID (say, 09497d46978bf6f32265fefb5cc52264).
            flash[:success]='You have successfully logged in'
            redirect_to root_path
        else
            flash.now[:error]='There was something wrong with your login information'
            render 'new'
        end
    end
end