class UsersController < ApplicationController
def index
  matching_users = User.all
  @list_of_users = matching_users.order({ :username => :asc})
  render({ :template => "user_templates/index.html.erb"})
end
def show
  url_username = params.fetch("path_username")
  mathching_usernames = User.where({ :username => url_username})
  @the_user = mathching_usernames.at(0)
  render({ :template => "user_templates/show.html.erb"})
end

def create
  input_record = params.fetch("insert_user_record")
  
  a_new_record = User.new
  
  a_new_record.username = input_record
  
  
  a_new_record.save
  
    #render({ :template => "photo_templates/create.html.erb"})
    redirect_to("/users/" + a_new_record.username.to_s )
  end

  def update
    the_name = params.fetch("modify_user")
    matching_users = User.where( :id => the_name)
    the_user_name = matching_users.at(0)
  
    input_username = params.fetch("input_username")
    
  
    the_user_name.username = input_username
    the_user_name.id = the_name
  
    the_user_name.save
    #Parameters: {"input_username"=>"er1", "modify_user"=>"138"}
    #render({ :template => "photo_templates/update.html.erb"})
    next_url = "/users/" + the_user_name.username.to_s
    redirect_to(next_url)
  end
end
