class GroupsController < ApplicationController


  def new
    @users = User.all
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループ名を入力してください"
      redirect_to :root
    else
      flash[:notice] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "グループを編集しました"
      redirect_to :root
    else
      flash[:notice] = "グループを編集してください"
      render :edit
    end
  end

  private
  def group_params
    group_users_ids = params[:group][:user_ids].uniq
    params.require(:group).permit(:group_name, user_ids:[]).merge(user_ids: group_users_ids)
  end
end
