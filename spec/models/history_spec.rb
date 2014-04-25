# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: histories
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  amount     :integer
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#  start_date :datetime
#

require 'spec_helper'

describe History do
  describe 'type_text'
  context 'type = LendHistory のとき' do
    it do
      history = LendHistory.create()
      expect(history.type_text).to eq("貸出")
    end
  end
  context 'type = ReturnHistory のとき' do
    it do
      history = ReturnHistory.create()
      expect(history.type_text).to eq("返却")
    end
  end
  context 'type = ReserveHistory のとき' do
    it do
      history = ReserveHistory.create()
      expect(history.type_text).to eq("予約")
    end
  end
  context 'type = CancelHistory のとき' do
    it do
      history = CancelHistory.create()
      expect(history.type_text).to eq("予約取消")
    end
  end
  context 'type = DestroyHistory のとき' do
    it do
      history = DestroyHistory.create()
      expect(history.type_text).to eq("破棄")
    end
  end
  context 'type = LoseHistory のとき' do
    it do
      history = LoseHistory.create()
      expect(history.type_text).to eq("紛失")
    end
  end
  context 'type = BreakHistory のとき' do
    it do
      history = BreakHistory.create()
      expect(history.type_text).to eq("故障")
    end
  end
  context 'type = RestoreHistory のとき' do
    it do
      history = RestoreHistory.create()
      expect(history.type_text).to eq("復旧")
    end
  end
end
