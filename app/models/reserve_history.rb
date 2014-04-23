# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: histories
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  amount     :integer
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#  start_date :datetime
#

class ReserveHistory < History
  validates :start_date, presence: true
  validate :start_date_check

  def start_date_check
    if start_date.nil? || start_date < Time.now
      errors.add(:start_date, '正しい日付を指定してください。')
    end
  end
end
