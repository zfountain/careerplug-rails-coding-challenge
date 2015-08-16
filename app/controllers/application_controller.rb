class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  # rescue_from CanCan::AccessDenied do |exception|
  #     redirect_to root_url, :alert => exception.message
  # end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
