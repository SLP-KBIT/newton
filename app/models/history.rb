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
  has_one :reservation
  belongs_to :item
  belongs_to :user

  # validates_presence_of :item, :item_id, message: '不正な物品です'
  # validates_presence_of :user, :user_id, message: '不正なユーザです'
  # validates :item_id, inclusion: { in: Item.pluck(:id), message: 'アイテムIDが間違えています' }
  # validates :amount, inclusion: { in: item_amount, message: '個数の指定に誤りがあります' }
  validates :item_id, :status, :amount, presence: true
  # validates :item_id, presence: { message: '入力してください', on: :lend_add }
  # validates :item_id, presence: { message: '入力してください', on: :lend_create }

  def item_amount
    amount = Item.where(id: item_id).first.amount
    [1..amount]
  end

  def status_text
    status_texts[status]
  end

  def self.status_text(status)
    status_texts[status]
  end

  def get_return_date
    @item = Item.where(id: item_id).first
    created_at + (@item.lending_period).days
  end

  def get_status_info
    [['返却', 1], ['破棄', 4], ['紛失', 5], ['故障', 6]]
  end

  private

  def status_texts
    ['貸出', '返却', '予約', '予約取消', '破棄', '紛失', '故障', '復旧']
  end

  def self.status_texts
    ['貸出', '返却', '予約', '予約取消', '破棄', '紛失', '故障', '復旧']
  end
end
