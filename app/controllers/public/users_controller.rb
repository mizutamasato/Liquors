class Public::UsersController < ApplicationController

  def index

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "登録情報を変更しました。"
      redirect_to my_page_path(@user.id)
    else
      render :edit and return
    end
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path    
  end
  
  def unsubscribe
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :introduction )
  end

end
