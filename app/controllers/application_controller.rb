class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    protect_from_forgery with: :exception
    
    def after_sign_in_path_for(resource)
     resource.role == 'admin' ? admin_dashboard_path : products_path
   end
 
   def authenticate_admin_user!
     raise SecurityError unless current_user.try(:role) == 'admin'
   end
 
   rescue_from SecurityError do |exception|
     redirect_to root_path
   end

    before_action :configure_permitted_parameters, if: :devise_controller?
    
     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
          end
end
