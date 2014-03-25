# -*- coding: utf-8 -*-
require 'spec_helper'

describe UserController do
  fixtures :users
  render_views
  describe '#index' do
    before { get :index }
    it { expect(assigns[:users]).to eq(User.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#add' do
    before { get :add }
    it { expect(assigns[:user]).to be_a_kind_of(User) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
  describe '#create' do
    let(:request) do
      post :create, user: {
        name: 's11t200',
        account: 'kumanon',
        admin_flag: true,
        category: category,
        lendable: true,
        e_mail: 's11t200@stmail.eng.kagawa-u.ac.jp',
        password: 'hogehoge',
        password_confirmation: 'hogehoge'
      }
    end
    context '成功時' do
      let(:category) { 1 }
      it 'ユーザ一覧ページへリダイレクトする' do
        request
        expect(response).to redirect_to user_path
      end
      it 'ユーザレコードが作成される' do
        request
        expect(assigns[:user]).to eq(User.last)
        expect(assigns[:result]).to be_true
      end
      it 'ユーザレコードが1件増える' do
        expect { request }.to change(User, :count).by(1)
      end
    end
    context '失敗時' do
      let(:category) { 3 }
      before { request }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
  end
  describe '#show' do
    before { get :show, id: 1 }
    it { expect(assigns[:user]).to be_a_kind_of(User) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
  describe '#edit' do
    before { get :edit, id: 1 }
    it { expect(assigns[:user]).to be_a_kind_of(User) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:edit) }
  end
  describe '#update' do
    before do
      session[:user_id] = User.first.id
      @user_param = {
        id: User.first.id,
        name: 's11t200',
        account: 'kumanon',
        admin_flag: true,
        category: 1,
        lendable: true,
        e_mail: 's11t200@stmail.eng.kagawa-u.ac.jp',
        password: 'hogehoge',
        password_confirmation: 'hogehoge'
      }
    end
    context '成功時' do
      before { patch :update, user: @user_param }
      it 'ユーザ一覧ページへリダイレクトする' do
        expect(response).to redirect_to user_path
      end
      it 'ユーザレコードが更新される' do
        expect(assigns[:user]).to eq(User.new(@user_param))
        expect(assigns[:result]).to be_true
      end
    end
    context '失敗時' do
      before do
        patch :update, user: @user_param.merge(category: 3)
      end
      it { expect(response).to render_template(:edit) }
      it { expect(response).to be_success }
      it 'ユーザレコードが更新される' do
        expect(assigns[:result]).to be_false
      end
    end
  end
  describe '#mainpage' do
    before { get :mainpage, id: 1 }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:mainpage) }
  end
end
