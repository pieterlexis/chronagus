class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit
  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
