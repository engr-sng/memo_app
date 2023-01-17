class MemosController < ApplicationController
  before_action :current_user

  def index
    @memo_new = Memo.new
    @memos = Memo.all
  end

  def create
    @memo_new = Memo.new(memos_params)
    @memos = Memo.all
    if @memo_new.save
      redirect_to root_path
    else
      render action: "index"
    end
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update(memos_params)
    redirect_to root_path
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to root_path
  end

  def ajax_create
    @memo_new = Memo.new(memos_params)
    @memos = Memo.all

    if @memo_new.save
      flash.now[:notice] = "メモの保存に成功しました。"
    else
      flash.now[:alert] = "メモの保存に失敗しました。"
    end
  end

  def search
    seach_word = params[:word]
    @memos = Memo.where("title LIKE ? or description LIKE ?", "%#{seach_word}%", "%#{seach_word}%")
    if @memos.count > 0
      flash.now[:notice] = "#{@memos.count}件のメモが見つかりました。"
    else
      flash.now[:alert] = "#メモが見つかりませんでした。"
    end
  end

  private

  def memos_params
    params.require(:memo).permit(:title, :description)
  end

end
