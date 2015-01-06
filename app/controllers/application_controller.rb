class ApplicationController < ActionController::Base
  before_filter :authenticate
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
     authenticate_or_request_with_http_basic "Admin" do |name, password|
       name     == ENV['ADMIN_USER']
       password == ENV['ADMIN_PASS']
     end
  end
end
