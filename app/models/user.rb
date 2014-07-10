# -*- coding: utf-8 -*-

# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  uid             :string(255)
#  admin_flag      :boolean
#  category        :integer
#  lendable        :boolean
#  e_mail          :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable # :database_authenticatable
         # :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :histories
  has_many :messages

  validates :name, :uid, presence: { message: '入力してください' }
  validates :password, presence: { message: '入力してください', on: :create }
  validates :category, inclusion: { in: [0, 1], message: '選択してください' }

  scope :id_is, -> (id) { where(id: id) }

  before_create :set_defaults

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

  def set_defaults
    self.admin_flag = false
    self.lendable = true
    self.category = 0
  end

  def category_texts
    ['サークル生', '学内者']
  end
end
