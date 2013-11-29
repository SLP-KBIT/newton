require 'spec_helper'

describe HistoryController do
  describe '#index' do
    before { get :index }
    it { expect(assigns[:histories]).to eq(History.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
end
