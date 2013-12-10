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

class User < ActiveRecord::Base
  validates :category, inclusion: { in: [1, 2], message: '選択してください' }

  def category_text
    return 'サークル生' if category == 1
    return '学内者'     if category == 2
  end

  def lendable_text
    return '有効' if lendable
    return '無効' unless lendable
  end

  def admin_flag_text
    return '管理者'     if admin_flag
    return '一般ユーザ' unless admin_flag
  end
end
