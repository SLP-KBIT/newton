require 'spec_helper'

describe ItemController do
  describe '#index' do
    before { get :index }
    it { expect(assigns[:items]).to eq(Item.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
end
