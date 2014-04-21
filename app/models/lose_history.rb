# == Schema Information
#
# Table name: histories
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  item_id        :integer
#  amount         :integer
#  failure_detail :text
#  created_at     :datetime
#  updated_at     :datetime
#  type           :string(255)
#  start_date     :datetime
#

class LoseHistory < History
end
