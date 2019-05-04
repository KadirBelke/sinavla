class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout

  private

  def layout
    # only turn it off for login pages:
    devise_controller? ? "devise" : "application"

    # or turn layout off for every devise controller:
    #devise_controller? && "application"
  end
end
