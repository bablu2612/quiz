class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :module_names
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_404
   
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
 
  def render_404
    render partial:"errors/error_404"
  end

  def module_names
    @modules=ModuleName.all
  end
  protected

end
