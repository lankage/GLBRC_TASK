class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if user && user.password == params[:session][:password]
        print user.password
        
        # Log the user in and redirect to the user's show page.
        log_in user
        
        redirect_to :main_index
    else
        # Create an error message.
      flash[:danger] = 'Invalid login / password combination'
      render 'new'
    end
  end

  def destroy
  end
end
