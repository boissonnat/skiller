#encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters

  protected
  def configure_permitted_parameters
    # Check Strong parameters for each Controller
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)

    if devise_controller?
      # Add organization as parameter to invitation
      devise_parameter_sanitizer.for(:invite).concat [:organization_id]
    end


  end
end
