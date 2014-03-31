# -*- coding: utf-8 -*-
require 'spec_helper'

describe HistoryController do
  fixtures :histories
  render_views

  describe '#index' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
      get :index
    end
    it { expect(assigns[:histories]).to eq(History.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end

  describe '#show' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
      get :show, id: 1
    end
    it { expect(assigns[:history]).to be_a_kind_of(History) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end

  describe '#lend_add' do
    before do
      session[:user_id] = User.first.id
      get :lend_add, page:{"2" => "2", "3" => "3"}
    end
    it { expect(assigns[:items]).to eq(Item.where(id: [2, 3])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:lend_add) }
  end

  describe '#lend_create' do
    before do
      session[:user_id] = User.first.id
      @history_param = {
        "1" => "1"
      }
      @history_param_false = {
         "20" => "1"
      }
    end
    context '成功時' do
      # before { post :lend_create, item: @history_param }
      pending('まだページができていないのでテストしない') do
        it '借り物リストへリダイレクトする' do
          # post :lend_create, history: @history_param
          post :lend_create, item: @history_param
          expect(response).to redirect_to action: 'mainpage', id: 1
        end
      end
      pending('エラーの解消法を検討中のためテストしない') do
      it '貸出レコードが作成される' do
        post :lend_create, item: @history_param
        expect(assigns[:history]).to eq(History.last)
        expect(assigns[:result]).to be_true
      end
      it '貸出レコードが一件増える' do
        post :lend_create, item: @history_param
        expect { post :lend_create, item: @history_param }.to change(History, :count).by(1)
      end
      end
    end
    context '失敗時' do
      # before { post :lend_create, history: @history_param_false }
      pending('エラーの解消法を検討中のためテストしない') do
        before { post :lend_create, item: @history_param_false }
        it { expect(assigns[:result]).to be_false }
        it {
          # p body: response.body
          get :lend_add
          expect(response).to render_template(:lend_add)
        }
        # it { expect(response).to be_success }
      end
    end
  end

  describe '#lend_confirm' do
    before do
      session[:user_id] = User.first.id
      get :lend_confirm, item:{"2" => "1", "3" => "2"}
    end
    it { expect(assigns[:items]).to eq(Item.where(id: [2, 3])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:lend_confirm) }
  end

  describe '#return_add' do
    before do
      session[:user_id] = User.first.id
      post :return_add, page:{"0" => "5", "1" => "6"}
    end
    it { expect(assigns[:histories]).to eq(History.where(id: [5, 6])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:return_add) }
  end

  describe '#return_confirm' do
    before do
      session[:user_id] = User.first.id
      post :return_confirm, state:{"5" => "1", "6" => "5"}
    end
    it { expect(assigns[:histories]).to eq(History.where(id: [5, 6])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:return_confirm) }
  end
end
