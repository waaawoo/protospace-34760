class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # ユーザーに紐づいたプロトタイプ取得
    @prototypes = @user.prototypes
  end
end
