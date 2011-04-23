class PagesController < ApplicationController

 def login
	  	if params[:user] == nil
	  		username = password = ""
	  	else
	  		username = params[:user][:username]
	  		password = params[:user][:password]
    	end
	  	conn = ActiveRecord::Base.connection
		  user_id = conn.select_value("select get_id('" + username + "','" + password + "')").to_i
	  	if username == password && username == "guest"
	  		cookies.signed[:user_id] = -1
	  		cookies.signed[:authenticated] = false
	  		redirect_to :controller => "pages", :action => "continue"
	  	elsif user_id > 0
	  		cookies.signed[:user_id] = user_id
	  		cookies.signed[:authenticated] = true
	  		redirect_to :controller => "pages", :action => "continue"
	  	end
	  end

		def continue
    if cookies.signed[:user_id] == -1
      @username = "Guest"
    else
      user = User.find(cookies.signed[:user_id])
      @username = user['username']
    end
  end
 
    def destroy
      redirect_to :controller => "pages", :action => "login"
    end

end
