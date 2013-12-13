# -*- coding: utf-8 -*-
require 'spec_helper'

describe ItemController do
  fixtures :items
  render_views
  describe '#index' do
    before { get :index }
    it { expect(assigns[:items]).to eq(Item.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#add' do
    before { get :add }
    it { expect(assigns[:item]).to be_a_kind_of(Item) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
  describe '#create' do
    before do
      @item_param = {
        name:           'ルンバ',
        attachments:    '充電器',
        lending_period: 7,
        category:       0,
        place:          '1909',
        amount:         1,
        trashed:        false,
        picture_path:   './img/roomba.png'
      }
    end
    context '成功時' do
      before { post :create, item: @item_param }
      it '物品一覧ページへリダイレクトする' do
        expect(response).to redirect_to item_path
      end
      it '物品レコードが作成される' do
        expect(assigns[:item]).to eq(Item.last)
        expect(assigns[:result]).to be_true
      end
      it '物品レコードが1件増える' do
        expect { post :create, item: @item_param }.to change(Item, :count).by(1)
      end
    end
    context '失敗時' do
      before { post :create, item: @item_param.merge(category: 3) }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
  end

  describe '#show' do
    before { get :show, id: 1 }
    it { expect(assigns[:item]).to be_a_kind_of(Item) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end

  describe '#update' do
    before do
      session[:item_id] = Item.first.id
      @item_param = {
        id:             Item.first.id,
        name:           'ルンバ',
        attachments:    '充電器',
        lending_period: 7,
        category:       0,
        place:          '1909',
        amount:         1,
        trashed:        false,
        picture_path:   './img/roomba.png'
      }
    end
    context '成功時' do
      before { patch :update, item: @item_param }
      it '物品一覧ページへリダイレクトする' do
        expect(response).to redirect_to item_path
      end
      it '物品レコードが更新される' do
        expect(assigns[:item]).to eq(Item.new(@item_param))
        expect(assigns[:result]).to be_true
      end
    end
    context '失敗時' do
      before do
        patch :update, item: @item_param.merge(category: 3)
      end
      it { expect(response).to render_template :edit }
      it { expect(response).to be_success }
      it 'アイテムレコードの更新が失敗する' do
        expect(assigns[:result]).to be_false
      end
    end
  end # #update
end
