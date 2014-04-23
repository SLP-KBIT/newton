# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: histories
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  item_id        :integer
#  amount         :integer
#  failure_detail :text
#  created_at     :datetime
#  updated_at     :datetime
#  type           :string(255)
#  start_date     :datetime
#

class History < ActiveRecord::Base
  has_one :reservation
  belongs_to :item
  belongs_to :user

  # validates_presence_of :item, :item_id, message: '不正な物品です'
  # validates_presence_of :user, :user_id, message: '不正なユーザです'
  # validates :item_id, inclusion: { in: Item.pluck(:id), message: 'アイテムIDが間違えています' }
  # validates :amount, inclusion: { in: item_amount, message: '個数の指定に誤りがあります' }
  validates :item_id, :amount, presence: true
  # validates :item_id, presence: { message: '入力してください', on: :lend_add }
  # validates :item_id, presence: { message: '入力してください', on: :lend_create }

  def item_amount
    amount = Item.where(id: item_id).first.amount
    [1..amount]
  end

  def type_text
    type_texts[type]
  end

  def self.type_text(type)
    type_texts[type]
  end

  def return_date
    @item = Item.where(id: item_id).first
    created_at + (@item.lending_period).days
  end

  def type_info
    [['返却', 'ReturnHistory'], ['紛失', 'LoseHistory'], ['故障', 'BreakHistory']]
  end

  private

  def type_texts
    { 'LendHistory' => '貸出', 'ReturnHistory' => '返却', 'ReserveHistory' => '予約', 'CancelHistory' => '予約取消', 'DestroyHistory' => '破棄', 'LoseHistory' => '紛失', 'BreakHistory' => '故障', 'RestoreHistory' => '復旧' }
  end

  def self.type_texts
    { 'LendHistory' => '貸出', 'ReturnHistory' => '返却', 'ReserveHistory' => '予約', 'CancelHistory' => '予約取消', 'DestroyHistory' => '破棄', 'LoseHistory' => '紛失', 'BreakHistory' => '故障', 'RestoreHistory' => '復旧' }
  end
end
