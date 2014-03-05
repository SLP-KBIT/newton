require 'spec_helper'

describe HistoryController do
  fixtures :histories
  render_views
  describe '#index' do
    before { get :index }
    it { expect(assigns[:histories]).to eq(History.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#show' do
    before { get :show, id: 1 }
    it { expect(assigns[:history]).to be_a_kind_of(History) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
  describe '#lend_add' do
    before { get :lend_add, page:{"2"=>"true","3"=>"true"}  }
    it { expect(assigns[:items]).to eq(Item.where(id: [2, 3])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:lend_add) }
  end
  describe '#return_add' do
    before { post :return_add, page:{"0"=>"5","1"=>"6"}  }    
    it { expect(assigns[:histories]).to eq(History.where(id: [5, 6])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:return_add) }
  end
  describe '#return_confirm' do
    before { post :return_confirm, state:{"5"=>"1", "6"=>"5"}  }    
    it { expect(assigns[:histories]).to eq(History.where(id: [5, 6])) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:return_confirm) }
  end
end
