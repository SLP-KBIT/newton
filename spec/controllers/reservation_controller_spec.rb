# -*- coding: utf-8 -*-
require 'spec_helper'

describe ReservationController do
  fixtures :histories, :users, :items
  render_views
  describe '#index' do
    before do
      sign_in User.where(admin_flag: false).first
      get :index
    end
    it { expect(assigns[:reservehistories]).to eq(ReserveHistory.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#show' do
    before do
      sign_in User.where(admin_flag: true).first
      get :show, id: 2
    end
    it { expect(assigns[:reservehistory]).to be_a_kind_of(ReserveHistory) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
  describe '#add' do
    before do
      sign_in User.where(admin_flag: false).first
      get :add, {"2" => "2", "3" => "3"}
    end
    it { expect(assigns[:items]).to eq(Item.where(id: [2, 3])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
  describe '#create' do
    before do
      sign_in User.where(admin_flag: false).first
      @history_param = {
        item:{"1" => "1"},
        start_date:{"1" => "2015-05-21"}
      }
      @history_param_false = {
        item:{"1" => "1"},
        start_date:{"1" => "2013-05-21"}
      }
    end
    context '成功時' do
      # before { post :lend_create, item: @history_param }
        it '予約一覧ページへリダイレクトする' do
          post :create, @history_param
        expect(response).to redirect_to reservation_path
        end
      it '予約レコードが作成される' do
        post :create, @history_param
        expect(assigns[:history]).to eq(History.last)
        expect(assigns[:result]).to be_true
      end
      it '予約レコードが一件増える' do
        post :create, @history_param
        expect { post :create, @history_param }.to change(History, :count).by(1)
      end
    end
    context '失敗時' do
        before { post :create, @history_param_false }
        it { expect(assigns[:result]).to be_false }
        it {
          # p body: response.body
          get :add
          expect(response).to render_template(:add)
        }
        it { expect(response).to be_success }
    end
  end
end
