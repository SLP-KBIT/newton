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

require 'spec_helper'

describe LoseHistory do
  # pending "add some examples to (or delete) #{__FILE__}"
end
