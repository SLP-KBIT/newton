# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  account    :string(255)
#  admin_flag :boolean
#  category   :integer
#  lendable   :boolean
#  e_mail     :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :histories
  has_many :messages

  validates :category, inclusion: { in: [0, 1], message: '選択してください' }

  def category_text
    category_texts[category]
  end

  def lendable_text
    return '有効' if lendable
    '無効'
  end

  def admin_flag_text
    return '管理者' if admin_flag
    '一般ユーザ'
  end

  private

  def category_texts
    ['サークル生', '学内者']
  end
end
