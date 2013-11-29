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
  def status_text
    return '貸出'       if status == 1
    return '返却'       if status == 2
    return '予約'       if status == 3
    return '予約取消'   if status == 4
    return '破棄'       if status == 5
    return '紛失'       if status == 6
    return '故障'       if status == 7
    return '復旧'       if status == 8
  end
end
