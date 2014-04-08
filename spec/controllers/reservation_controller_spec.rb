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
end
