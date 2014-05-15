# -*- coding: utf-8 -*-

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

class User < ActiveRecord::Base
  has_secure_password

  has_many :histories
  has_many :messages

  validates :name, :account, presence: { message: '入力してください' }
  validates :password, presence: { message: '入力してください', on: :create }
  validates :category, inclusion: { in: [0, 1], message: '選択してください' }

  scope :id_is, -> (id) { where(id: id) }

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
