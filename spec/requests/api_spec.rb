require 'spec_helper'

describe 'API' do
  describe 'GET history/lend' do
    context '無効なUser IDの場合' do
      before do
        @params = { uid: 'hogehoge' }
      end

      it 'result: unknown user が返ってくる' do
        get '/api/history/lend', @params
        json = JSON.parse(response.body)

        expect(response).to be_success
        expect(response.status).to eq(200)

        expect(json['result']).to eq('unknown user')
      end
    end

    context '有効なUser IDの場合' do
      before do
        @user = User.first
        @params = { uid: @user.uid }
      end

      it 'result: success が返ってくる' do
        get '/api/history/lend', @params
        json = JSON.parse(response.body)

        expect(response).to be_success
        expect(response.status).to eq(200)

        expect(json['items'].is_a? Array).to be_true
        expect(json['url']).to match(/^http:\/\/.*\/user\/mainpage\/#{@user.id}/)
        expect(json['result']).to eq('success')
      end
    end
  end
end
