require 'spec_helper'

describe UserController do
  describe '#index' do
    before { get :index }
    it { expect(assigns[:users]).to eq(User.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
end
