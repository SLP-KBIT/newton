require 'spec_helper'

describe ReservationController do
  fixtures :reservation
  render_views
  describe '#index' do
    before do
      session[:user_id] = User.first.id
      get :index    
    end
    it { expect(assigns[:reservation]).to eq(Reservation.all) }
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
end
