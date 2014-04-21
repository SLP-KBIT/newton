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
#  created_at     :datetime
#  updated_at     :datetime
#  image          :string(255)
#

class Item < ActiveRecord::Base
  has_many :histories
  validates :category, inclusion: { in: [0, 1, 2], message: '選択してください' }
  mount_uploader :image, ImageUploader

  def category_text
    category_texts[category]
  end

  def trashed_text
    return '有' if trashed
    '無'
  end

  def image_exist?
    return false if image.path.nil?
    File.exist? image.path
  end

  private

  def category_texts
    ['その他', 'PC', 'デジカメ']
  end

  def trashed_texts
    return '有' if trashed
    '無'
  end
end
