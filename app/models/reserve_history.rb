# -*- coding: utf-8 -*-
class ReserveHistory < History
  validates :start_date, presence: true
  validate :start_date_check

  def start_date_check
    if start_date.nil? || start_date < Time.now
      errors.add(:start_date, '正しい日付を指定してください。')
    end
  end
end
