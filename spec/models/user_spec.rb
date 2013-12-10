# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  age        :integer
#  created_at :datetime
#  updated_at :datetime
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
end
