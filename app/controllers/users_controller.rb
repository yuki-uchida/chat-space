class UsersController < ApplicationController


  def search


      @users = User.users_get(current_user, params)
    respond_to do |format|
       format.json
    end
  end
  def edit
  end
  def update
    if current_user.update(update_params)
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to :root
    else
      render :edit
      flash[:notice] = "ユーザー情報を変更してください"
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :email)
  end
end
