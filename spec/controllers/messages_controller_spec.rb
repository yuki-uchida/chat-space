require 'rails_helper'

describe MessagesController, type: :controller do


  let(:user){create(:user)}
  let(:group){create(:group)}
  let(:message){create(:message)}




#メッセージ表示
  describe 'GET #index' do

    #ログインしていない場合
    context 'when user not signed in' do
      it "redirect to the login page" do
         get :index, group_id: group.id
         expect(response).to redirect_to(new_user_session_path)
      end
    end


    #ログインしてる場合
    context 'when user signed in' do
      before do
        sign_in user
        get :index , group_id: group.id
      end
      it "assign the requested @group" do
        expect(assigns(:group)).to eq group
      end
      it "make instance message" do
       @message = create(:message)

       expect(@message).to be_valid
      end
      it "has a messages" do
        expect(message).to be_valid
      end
      it "renders the :index templete" do
        expect(response).to render_template :index
      end
    end
end



#メッセージ保存
  describe 'POST #create' do
    #ログインしていてメッセージの保存に成功
    context 'when user signed in' do
      before do
        sign_in user
      end




      it "success create message and save in datebase" do
        expect{
          post :create, params: {group_id: group.id, message: attributes_for(:message)}
          }.to change(Message, :count).by(1)
      end

      it "renders the index page" do
        post :create, params: {group_id: group.id, message: attributes_for(:message)}
         expect(response).to redirect_to(group_messages_path(group_id: group.id))
      end

      #ログインしているがメッセージの保存に失敗
      it "fail create message without message-body" do
        expect{
          post :create, params: {group_id: group.id, message: attributes_for(:message, body: nil)}
        }.not_to change(Message, :count)
      end
      it "fail create message without message-body&image" do
        expect{
          post :create, params: {group_id: group.id, message: attributes_for(:message, body: nil, image: nil)}
        }.not_to change(Message, :count)
      end
      it "renders the new page" do
        post :create, params: {group_id: group.id, message: attributes_for(:message, body: nil)}
        expect(response).to render_template("messages/index")
      end
    end
    context 'when user not signed in' do
      #ログインしていないばあい
      it "renders the login page" do
        post :create, params: { group_id: group.id, message: attributes_for(:message)}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


end
