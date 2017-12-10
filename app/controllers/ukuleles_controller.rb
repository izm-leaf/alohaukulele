class UkulelesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_uku, only: [:update, :edit, :destroy]

  def index
    @ukuleles = Ukulele.all
  end

  def new
    if current_user.admin?
    @size = Size.all
    @wood = Wood.all

    if params[:back]
      @ukulele = Ukulele.new(uku_params)
    else
      @ukulele = Ukulele.new
    end
    else
      redirect_to ukuleles_path
    end
  end

  def create
    @ukulele = Ukulele.new(uku_params)
    if @ukulele.save
      redirect_to ukuleles_path, notice: "登録しました"
      NoticeMailer.sendmail_aloha(@ukulele).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @ukulele.update(uku_params)
    redirect_to ukuleles_path, notice: "編集しました"
  end

  def destroy
    @ukulele.destroy
    redirect_to ukuleles_path, notice: "削除しました"
  end

  def confirm
    @ukulele = Ukulele.new(uku_params)
    @size = Size.find(@ukulele.size_id)
    @wood = Wood.find(@ukulele.wood_id)
    render :new if @ukulele.invalid?
  end

private

  def uku_params
    params.require(:ukulele).permit(:size_id, :wood_id, :image, :image_cache, :model, :content)
  end

  def set_uku
    @ukulele = Ukulele.find(params[:id])
  end

end
