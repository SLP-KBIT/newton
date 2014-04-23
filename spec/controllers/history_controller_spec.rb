# -*- coding: utf-8 -*-
require 'spec_helper'

describe HistoryController do
  fixtures :histories, :items, :users
  render_views

  describe '#index' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
      get :index
    end
    it { expect(assigns[:histories]).to eq(History.all.order('created_at DESC')) }
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
    it { expect(assigns[:items]) == (Item.where(id: [2, 3])) }
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
         "1" => "5"
      }
    end
    context '成功時' do
      # before { post :lend_create, item: @history_param }
      it '借り物リストへリダイレクトする' do
        # post :lend_create, history: @history_param
        post :lend_create, item: @history_param, reason: { "1" => "" }
        expect(response).to redirect_to controller: 'user', action: 'mainpage', id: session[:user_id]
      end
      it '貸出レコードが作成される' do
        post :lend_create, item: @history_param, reason: { "1" => "" }
        expect(assigns[:history]).to eq(History.last)
        expect(assigns[:result]).to be_true
      end
      it '貸出レコードが一件増える' do
        post :lend_create, item: @history_param, reason: { "1" => "" }
        expect { post :lend_create, item: @history_param, reason: { "1" => "" } }.to change(History, :count).by(1)
      end
    end
    # context '失敗時' do
    #   # before { post :lend_create, history: @history_param_false }
    #     before { post :lend_create, item: @history_param_false }
    #     it { expect(assigns[:result]).to be_false }
    #     it {
    #       # p body: response.body
    #       get :lend_add
    #       expect(response).to render_template(:lend_add)
    #     }
    #     # it { expect(response).to be_success }
    # end
  end

  describe '#lend_confirm' do
    before do
      session[:user_id] = User.first.id
      get :lend_confirm, item:{"2" => "1", "3" => "2"}, reason:{"2" => "", "3" => ""}
    end
    it { expect(assigns[:items]) == (Item.where(id: [2, 3])) }
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
      post :return_confirm, type:{"5" => "1", "6" => "5"}
    end
    it { expect(assigns[:histories]).to eq(History.where(id: [5, 6])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:return_confirm) }
  end

  describe '#return_create' do
    before do
      session[:user_id] = User.first.id
      @type = { "1" => "ReturnHistory" }
      @report = { "1" => "" }
    end
    context '成功時' do
      it '借り物リストへリダイレクトする' do
        post :return_create, type: @type, report: @report
        expect(response).to redirect_to controller: 'user', action: 'mainpage', id: session[:user_id]
      end
      it '返却レコードが作成される' do
        post :return_create, type: @type, report: @report
        expect(assigns[:history]).to eq(History.last)
        expect(assigns[:result]).to be_true
      end
      it '返却レコードが一件増える' do
        post :return_create, type: @type, report: @report
        expect { post :return_create, type: @type, report: @report }.to change(History, :count).by(1)
      end
    end
  end
end
