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
  has_many :histories

  validates :category, inclusion: { in: [0, 1, 2], message: '選択してください' }

  def category_text
    category_texts[category]
  end

  def trashed_text
    return '有' if trashed
    '無'
  end

  def get_schema
    return {
      'id' => self.id,
      'name' => self.name,
      'attachments' => self.attachements,
      'lending_period' => self.lending_period,
      'category' => self.category,
      'place' => self.place,
      'amount' => self.amount,
      'trashed' => self.trashed,
      'picture_path' => self.picture_path,
      'created_at' => self.created_at,
      'updated_at' => self.updated_at
    }
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
