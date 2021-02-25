class PrototypesController < ApplicationController
  # ログインしていないユーザーのアクセス制限
  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
    # 紐づくユーザー情報も取得
    @prototype = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    # コメント後投稿後にプロトタイプのshowでコメントを扱うために作成
    @comment = Comment.new
    # プロトタイプに紐づているコメントとユーザー情報を1回で取得
    @comments = @prototype.comments.includes(:user)

  end

  def edit
    @prototype = Prototype.find(params[:id])
    # 投稿者以外が編集できないように
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  # 許可するパラメータを指定（imageは画像用）
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
