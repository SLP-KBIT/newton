# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  attachments    :text
#  lending_period :integer
#  category       :integer
#  place          :text
#  amount         :integer
#  trashed        :boolean
#  picture_path   :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Item < ActiveRecord::Base
  validates :category, inclusion: { in: [0, 1, 2], message: '選択してください' }

  def category_text
    return 'その他'   if category == 0
    return 'PC'       if category == 1
    return 'デジカメ' if category == 2
  end

  def trashed_text
    return '有' if trashed
    return '無' unless trashed
  end
end
