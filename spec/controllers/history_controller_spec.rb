# -*- coding: utf-8 -*-
require 'spec_helper'

describe HistoryController do
  fixtures :histories
  render_views
  describe '#index' do
    before { get :index }
    it { expect(assigns[:histories]).to eq(History.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#show' do
    before { get :show, id: 1 }
    it { expect(assigns[:history]).to be_a_kind_of(History) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end

  describe '#lend_add' do
    before { get :lend_add  }
    it { expect(assigns[:history]).to be_a_kind_of(History) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:lend_add) }

  end

  describe '#lend_create' do
    before do
      @history_param = {
        item_id: 1,
        amount:  1 
      }
    end
    context '成功時' do
      before { post :lend_create, item: @history_param }
      pending('まだページができていないのでテストしない') do
      it '借り物リストへリダイレクトする' do
        expect(response).to redirect_to :action => 'mainpage', :id => 1
      end
      end
      it '貸出レコードが作成される' do
        expect(assigns[:history]).to eq(Histiry.last)
        expect(assigns[:result]).to be_true
      end
      it '貸出レコードが一件増える' do
        expect( post :create, history: @history_param ).to change(History, :count).by(1)
      end  
    end
    context '失敗時' do
      before { post :lend_create, history: @history_param }
      it { expect(response).to render_template(:show) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }    
    end
end
