class ApplicationController < ActionController::Base
  # リダイレクト処理
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # deviceでユーザー登録する時に特定のカラムを許容するメソッド
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end
