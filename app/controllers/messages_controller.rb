class MessagesController < ApplicationController
  before_action :set_variables, only: [:index]
  def index
    @group = Group.find(params[:group_id])
    #@messages = @group.messages
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end
  def create

    @message = Message.create(message_params)
    @group = Group.find(params[:group_id])
    respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice:  "メッセージを送信しました"}
        format.json
      end
  end


  private
  def message_params
    params.require(:message).permit(:image, :body).merge(user_id: current_user.id, group_id: params[:group_id])
   end
   def set_variables
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end

end
