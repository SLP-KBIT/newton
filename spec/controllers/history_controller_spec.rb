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
        "1" => "1"
      }
      @history_param_false = {
         '20' => '1'
      }

    end
    context '成功時' do
      # before { post :lend_create, item: @history_param }
      pending('まだページができていないのでテストしない') do
        it '借り物リストへリダイレクトする' do
#          post :lend_create, history: @history_param
          post :lend_create, item: @history_param          
          expect(response).to redirect_to :action => 'mainpage', :id => 1
        end
      end
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
    context '失敗時' do
#      before { post :lend_create, history: @history_param_false }
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
