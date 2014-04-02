require 'spec_helper'

describe LoginController do
  fixtures :users
  render_views

  describe '#login' do
    context 'ログインに成功する場合' do
      before do
        post :login, user: {account: 'admin', password: 'hoge'}
      end
      # it { expect(response).to redirect_to(root_path) }
      it { expect(session[:user_id]) == 1 }
    end

    context 'ログインに失敗した場合' do
      before do
        post :login, user: { name: 'admin', pass: 'hogehoge' }
      end
      it { expect(flash).not_to be_empty }
      it { expect(response).to be_success }
      it { expect(response).to render_template('new') }
    end
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(response).to render_template('new') }
  end

  describe '#destroy' do
    before { get :destroy }
    context 'ログイン情報をクリアする' do
      it { expect(session[:user_id]).to be_nil }
      it { expect(assigns[:current_user]).to be_nil }
      it { expect(response).to redirect_to(login_path) }
    end
  end
end
