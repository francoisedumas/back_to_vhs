class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Cookies
  before_action :set_cookies_acceptation

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def set_cookies_acceptation
    # Comment: the test on Google analytics is as below so by default if we don't accept
    # cookies[:accept_google_analytics] == "true" is falsy so Google analytics is not activated
    # <% if Rails.env.production? && cookies[:accept_google_analytics] == "true" %>
    if !cookies[:accept_google_analytics].present? && params[:accept_google_analytics].present?
      cookies[:accept_google_analytics] = params[:accept_google_analytics] == "true" ? "true" : "false"
    end
  end
end
