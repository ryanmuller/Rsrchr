class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def mendeley
    redirect_to root, notice: "Signed into Mendeley: #{request.env["omniauth.auth"]}"
  end
end

