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
  describe '#add' do
    before { get :add }
    it { expect(assigns[:messages]).to be_a_kind_of(Message) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
  end
end
