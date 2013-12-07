class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env['omniauth.auth']

    @user = User.find_or_create_by(uid: auth.uid) do |user|
      user.email = auth.info.email
      user.name = auth.extra.raw_info.name
    end

    if @user.persisted?
      set_flash_message(:notice, :success, kind: 'Facebook')
      sign_in_and_redirect @user
    else
      redirect_to root_path, alert: 'Something went wrong'
    end
  end
end
