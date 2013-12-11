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
    category_texts[category]
  end

  def trashed_text
    return '有' if trashed
    return '無'
  end

  private

  def category_texts
    ['その他', 'PC', 'デジカメ']
  end

  def trashed_texts
    return '有' if trashed
    return '無'
  end
end
