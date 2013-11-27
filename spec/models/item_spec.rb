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

require 'spec_helper'

describe Item do
  describe 'category_text' do
    context 'category = 1のとき' do
      it {
        item = Item.create(category: 1)
        expect(item.category_text).to eq("PC") 
      }
    end
    context 'category = 2のとき' do
      it {
        item = Item.create(category: 2)
        expect(item.category_text).to eq("デジカメ") 
      }
    end
  end
end
