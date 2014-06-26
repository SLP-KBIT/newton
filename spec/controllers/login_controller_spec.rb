require 'spec_helper'

describe LoginController do
  fixtures :users
  render_views

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(response).to render_template('new') }
  end
end
