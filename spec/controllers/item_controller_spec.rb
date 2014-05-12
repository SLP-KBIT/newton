# -*- coding: utf-8 -*-
require 'spec_helper'

describe ItemController do
  fixtures :items
  render_views
  describe '#index' do
    before do
      session[:user_id] = User.first.id
      get :index
    end
    it { expect(assigns[:items]).to eq(Item.all) }
    # it { expect(assigns[:items]).to eq(Item.where(trashed: false)) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#add' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
      get :add
    end
    it { expect(assigns[:item]).to be_a_kind_of(Item) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
  describe '#create' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
      @item_param = {
        name:           'ルンバ',
        attachments:    '充電器',
        lending_period: 7,
        category:       0,
        place:          '1909',
        amount:         1,
        trashed:        false,
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
    context '失敗時(カテゴリの値がおかしい時)' do
      before { post :create, item: @item_param.merge(category: 3) }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
    context '失敗時(nameがからの時)' do
      before { post :create, item: @item_param.merge(name: nil) }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
    context '失敗時(lending_periodがからの時)' do
      before { post :create, item: @item_param.merge(lending_period: nil) }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
    context '失敗時(amountがからの時)' do
      before { post :create, item: @item_param.merge(amount: nil) }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
    context '失敗時(lending_periodが数値ではない時)' do
      before { post :create, item: @item_param.merge(lending_period: "aiue") }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
    context '失敗時(amountが数値ではない時)' do
      before { post :create, item: @item_param.merge(amount: "abc") }
      it { expect(response).to render_template(:add) }
      it { expect(response).to be_success }
      it { expect(assigns[:result]).to be_false }
    end
  end
  describe '#show' do
    before do
      session[:user_id] = User.first.id
      get :show, id: 1
    end
    it { expect(assigns[:item]).to be_a_kind_of(Item) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
  describe '#update' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
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

  describe '#edit' do
    before do
      session['user_id'] = User.where(admin_flag: true).first.id
      get :edit, id: 1
    end
    it { expect(assigns[:item]).to be_a_kind_of(Item) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:edit) }
  end
end
