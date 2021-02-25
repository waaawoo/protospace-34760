class PrototypesController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  private

  # 許可するパラメータを指定（imageは画像用）
  def prototype_params
    params.require(:prototype).permit(:title, :image).merge(user_id: current_user.id)
  end
end
