# -*- coding: utf-8 -*-
require 'spec_helper'

describe MessageController do
  fixtures :messages
  render_views
  describe '#index' do
    before do
      session[:user_id] = User.first.id
      get :index
    end
    it { expect(assigns[:messages]).to eq(Message.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#add' do
    before do
      session[:user_id] = User.first.id
      get :add
    end
    it { expect(assigns[:messages]).to be_a_kind_of(Message) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
  describe '#create' do
    let(:request) do
      post :create, message: {
        subject: 'システム復旧のお知らせ',
        comtent: 'システム復旧しました',
      },
      page: {"1" => "true"}
    end
    before { session[:user_id] = User.where(admin_flag: true).first.id }
    context '成功時' do
      let(:category) { 1 }
      it 'メッセージページへリダイレクトされる' do
        request
        expect(response).to redirect_to message_path
      end
      it 'メッセージレコードが作成される' do
        request
        expect(assigns[:new_message]).to eq(Message.last)
        expect(assigns[:result]).to be_true
      end
      it 'メッセージレコードが1件増える' do
        expect { request }.to change(Message, :count).by(1)
      end
    end
  end 
end
