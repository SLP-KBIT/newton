# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  account         :string(255)
#  admin_flag      :boolean
#  category        :integer
#  lendable        :boolean
#  e_mail          :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  describe 'category_text' do
    context 'category = 0のとき' do
      it {
        user = User.create(category: 0)
        expect(user.category_text).to eq("サークル生")
      }
    end
    context 'category = 1のとき' do
      it {
        user = User.create(category: 1)
        expect(user.category_text).to eq("学内者")
      }
    end
  end
  describe 'バリデーションのテスト' do
    fixtures :users
    before(:each) do
      @user = users(:admin)
    end
    it "nameが空の時、エラーが発生すること" do
      @user.name = ""
      @user.should_not be_valid
    end
    it "accountが空の時、エラーが発生すること" do
      @user.account = ""
      @user.should_not be_valid
    end
  end
end
