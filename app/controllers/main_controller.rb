class MainController < ApplicationController

  def index
    
    print "Fetching records"
    @apps = UserSelectedApplication.where(:is_selected => 1, :user_id => current_user.id).to_a
    applicationIds = Array.new
    @apps.each do |appObject|
      applicationIds << appObject.application_id
    end
    @applications = Application.where(id: applicationIds)
    @applications.inspect
    @all_applications = Application.all
    
  end
  
  def add
      app = params[:application]
     print app[:application_id]
     UserSelectedApplication.where(:user_id => current_user.id, :application_id => app[:application_id]).update_all(:is_selected => 1)
      
    @apps = UserSelectedApplication.where(:is_selected => 1, :user_id => current_user.id).to_a
    applicationIds = Array.new
    @apps.each do |appObject|
      applicationIds << appObject.application_id
    end
    @applications = Application.where(id: applicationIds)
    @applications.inspect
    @all_applications = Application.all
   
    render :action => 'index'
   # @selected_app = Application.find(2)
   # @selected_app.inspect
  end
  
  def remove
      app = params[:appremove]
      UserSelectedApplication.where(:user_id => current_user.id, :application_id => app).update_all(:is_selected => 0)
       @apps = UserSelectedApplication.where(:is_selected => 1, :user_id => current_user.id).to_a
    applicationIds = Array.new
    @apps.each do |appObject|
      applicationIds << appObject.application_id
    end
    @applications = Application.where(id: applicationIds)
    @applications.inspect
    @all_applications = Application.all
    render :action => 'index'
  end
  
end
