require 'spec_helper'

describe MessageController do
  fixtures :messages
  render_views
  describe '#index' do
    before do
      session[:user_id] = User.first.id
      get :index
    end
    it { expect(assigns[:messages]).to eq(Message.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#add' do
    before do
      session[:user_id] = User.first.id
      get :add
    end
    it { expect(assigns[:messages]).to be_a_kind_of(Message) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
end
