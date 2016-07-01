class WelcomeController < ApplicationController

  skip_before_action :authenticate, only: [:login, :logout]

  def login
    unless request.get?
      @username = params[:username]
      @password = params[:password]

      user = User.authenticate(@username, @password)

      if user
        session[:username] = user.username
        redirect_to users_path
      else
        flash.now[:error] = '用户名或密码错误'
      end
    end
  end

  def logout
    reset_session
    redirect_to controller: :welcome, action: :login
  end

end
