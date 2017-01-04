class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def iframe_action
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://dash-battle.herokuapp.com"
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://localhost:3000"
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://localhost:3001"
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || projects_path
  end
end
