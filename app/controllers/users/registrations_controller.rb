class Users::RegistrationsController < Devise::RegistrationsController
  before_action :lists_selects, only: [:new, :create, :edit, :update]
	before_action :configure_permitted_parameters if :devise_controller?

  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_functionary 
    respond_with self.resource
  end

  def create
    super
    build_resource(sign_up_params)
		resource.save
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email, :password, :password_confirmation, 
      :functionary_attributes => [:id, :matriculation, :name, :function, :active, :leader]
    ])      
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :email, :password, :password_confirmation
    ])    
  end

  private
    def lists_selects
      @list_leaders = Functionary.where(function: :leader).order(:name).select(:id, :name)
    end

end
