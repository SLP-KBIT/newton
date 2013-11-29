# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: histories
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  item_id        :integer
#  status         :integer
#  amount         :integer
#  failure_detail :text
#  detail_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe History do
  describe 'status_text'
  context 'status = 1のとき' do
    it do
      history = History.create(status: 1)
      expect(history.status_text).to eq("貸出") 
    end
  end
  context 'status = 2のとき' do
    it do
      history = History.create(status: 2)
      expect(history.status_text).to eq("返却") 
    end
  end
  context 'status = 3のとき' do
    it do
      history = History.create(status: 3)
      expect(history.status_text).to eq("予約") 
    end
  end
  context 'status = 4のとき' do
    it do
      history = History.create(status: 4)
      expect(history.status_text).to eq("予約取消") 
    end
  end
  context 'status = 5のとき' do
    it do
      history = History.create(status: 5)
      expect(history.status_text).to eq("破棄") 
    end
  end
  context 'status = 6のとき' do
    it do
      history = History.create(status: 6)
      expect(history.status_text).to eq("紛失") 
    end
  end
  context 'status = 7のとき' do
    it do
      history = History.create(status: 7)
      expect(history.status_text).to eq("故障") 
    end
  end
  context 'status = 8のとき' do
    it do
      history = History.create(status: 8)
      expect(history.status_text).to eq("復旧") 
    end
  end
end
