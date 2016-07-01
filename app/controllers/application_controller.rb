class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    if session[:username].blank?
      if request.xhr?
        render js: %(window.location.pathname="#{root_path}")
      else
        redirect_to(url_for(controller: 'welcome', action: 'login'), flash: {:error => t('general.not_authenticated')})
      end
    end
  end

end
