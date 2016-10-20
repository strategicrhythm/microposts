class BookmarksController < ApplicationController
 #お気に入り登録用アクション
  def create
    @user_id = session[:id] #ログインしたユーザのID
    @micropost_id = Micropost.find(params[:id]).id #特定のつぶやきのID
    #micropost_idに@micropost_id、user_idに@user_idを入れて、Bookmarkモデルに新しいオブジェクトを作る
    @bookmark = Bookmark.new(micropost_id: @micropost_id, user_id: @user_id)
    if @bookmark.save
      #保存に成功した場合、つぶやき一覧画面に戻る
      redirect_to @user
    end
  end

  #お気に入り削除用アクション
  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to @user
    end
  end
end
