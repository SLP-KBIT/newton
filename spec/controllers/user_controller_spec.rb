require 'spec_helper'

describe UserController do
  fixtures :users
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
  describe '#show' do
    before { get :show, id: 1 }
    it { expect(assigns[:user]).to be_a_kind_of(User) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
end
