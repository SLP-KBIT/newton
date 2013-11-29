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
  def category_text
    return "サークル生" if category == 1
    return "学内者"     if category == 2
  end
end
