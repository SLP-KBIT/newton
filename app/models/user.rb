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
  validates(:category,
            inclusion: { in: [1, 2], message: '選択してください' }
            )

  def category_text
    category_texts[category]
  end

  def lendable_text
    return '有効' if lendable
    return '無効'
  end

  def admin_flag_text
    return '管理者' if admin_flag
    return '一般ユーザ'
  end

  private

  def category_texts
    ['サークル生', '学内者']
  end
end
