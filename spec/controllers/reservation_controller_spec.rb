require 'spec_helper'

describe ReservationController do
  fixtures :histories, :users, :items
  render_views
  describe '#index' do
    before do
      session[:user_id] = User.first.id
      get :index
    end
    it { expect(assigns[:reservehistories]).to eq(ReserveHistory.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
  describe '#show' do
    before do
      session[:user_id] = User.where(admin_flag: true).first.id
      get :show, id: 2
    end
    it { expect(assigns[:reservehistory]).to be_a_kind_of(ReserveHistory) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
  end
end
