# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  contents   :text
#  from       :string(255)
#  read_flag  :boolean
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Message do
  # pending "add some examples to (or delete) #{__FILE__}"
end
