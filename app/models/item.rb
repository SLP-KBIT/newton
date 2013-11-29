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
  def category_text
    return 'PC'       if category == 1
    return 'デジカメ' if category == 2
  end
end
