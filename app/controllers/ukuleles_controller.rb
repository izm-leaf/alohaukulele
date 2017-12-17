class UkulelesController < ApplicationController
  before_action :authenticate_user!, only: [:update, :new, :create, :edit, :confirm, :destroy]
  before_action :set_uku, only: [:show, :update, :edit, :destroy]
  before_action :set_size_wood, only: [:new, :edit, :confirm]
  authorize_resource :only => [:new, :edit]

  def index
    @ukuleles = Ukulele.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @comment = @ukulele.comments.build
    @comments = @ukulele.comments
  end

  def new
    if params[:back]
      @ukulele = Ukulele.new(uku_params)
    else
      @ukulele = Ukulele.new
    end
  end

  def create
    @ukulele = Ukulele.new(uku_params)
    if @ukulele.save
      flash[:success] = "登録しました"
      redirect_to ukuleles_path
      NoticeMailer.sendmail_aloha(@ukulele).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @ukulele.update(uku_params)
    flash[:success] = "編集しました"
    redirect_to ukulele_path
  end

  def destroy
    @ukulele.destroy
    flash[:success] = "削除しました"
    redirect_to ukuleles_path
  end

  def confirm
    @ukulele = Ukulele.new(uku_params)
    render :new if @ukulele.invalid?
  end

private

  def uku_params
    params.require(:ukulele).permit(:size_id, :wood_id, :image, :image_cache, :model, :content)
  end

  def set_uku
    @ukulele = Ukulele.find(params[:id])
  end

  def set_size_wood
    @size = Size.all.order(:id)
    @wood = Wood.all.order(:id)
  end
end
