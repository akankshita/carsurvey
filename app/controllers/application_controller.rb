class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_login
  def check_login
    if session[:id].nil?
       redirect_to '/'
    end
  end
end
