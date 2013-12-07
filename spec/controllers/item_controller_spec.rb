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
  describe '#show' do
    before { get :show, id: 1 }
    it { expect(assigns[:item]).to be_a_kind_of(Item) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
end
