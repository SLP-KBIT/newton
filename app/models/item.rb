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
    self.class.category_text.key(category)
  end

  def trashed_text
    return '有' if trashed
    '無'
  end

  def image_exist?
    return false if image.path.nil?
    File.exist? image.path
  end

  def self.category_text
    { 'その他' => 0, 'PC' => 1, 'カメラ' => 2 }
  end

  private

  def trashed_texts
    return '有' if trashed
    '無'
  end
end
