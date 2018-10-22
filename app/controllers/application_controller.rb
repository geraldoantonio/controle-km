class ApplicationController < ActionController::Base
  #Devise
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end

  # CSV
  require 'csv'



end
