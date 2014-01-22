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

class History < ActiveRecord::Base
  #has_many: reservation
  belongs_to :item
  belongs_to :user

  def status_text
    status_texts[status]
  end

  private

  def status_texts
    ['貸出', '返却', '予約', '予約取消', '破棄', '紛失', '故障', '復旧']
  end
end
