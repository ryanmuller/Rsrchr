class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def mendeley
    current_user.mendeley_token = request.env["omniauth.auth"]["credentials"]["token"]
    current_user.mendeley_secret = request.env["omniauth.auth"]["credentials"]["secret"]
    current_user.save
    redirect_to root, notice: "Connected to Mendeley"
  end

  def blank
    render :text => "Not found", :status => 404
  end
end

