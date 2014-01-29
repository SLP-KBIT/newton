# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  start_date :datetime
#  created_at :datetime
#  updated_at :datetime
#  history_id :integer
#

class Reservation < ActiveRecord::Base
  belongs_to :history
end
