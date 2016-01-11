class WelcomeController < ApplicationController

  def login
    if request.get?
      render :layout => 'login'
    else
      @username = params[:username]
      @password = params[:password]

      user = User.authenticate(@username, @password)

      if user
        redirect_to users_path
      else
        flash.now[:error] = '用户名或密码错误'
      end
    end
  end

end
