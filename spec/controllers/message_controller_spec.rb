require 'spec_helper'

describe MessageController do
  fixtures :messages
  render_views
  describe '#index' do
    before { get :index }
    it { expect(assigns[:messages]).to eq(Message.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
end
