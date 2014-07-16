# -*- coding: utf-8 -*-
class API < Grape::API
  format :json

  resource 'history/lend' do

    users = User.where(uid: "takamatsu").first
    # users = User.where(uid: params[:users][:uid])

    get do
      return { result: 1 } if users.blank? 
      
      @item_ids = History.where(user_id: 1).order(:created_at).pluck(:item_id).uniq
      @histories = History.where(user_id: 1).where.not('type = ?', 'ReserveHistory')
      # @item_ids = History.where(user_id: params[:users][:id]).order(:created_at).pluck(:item_id).uniq
      # @histories = History.where(user_id: params[:users][:id]).where.not('type = ?', 'ReserveHistory')

      @lending_item_ids = []
      @history_ids = []

      @item_ids.each do |id|
        @history = @histories.where(item_id: id).order(:created_at).reverse_order.first      
        if @history.present? && @history.type == 'LendHistory'
          @history_ids.push(@history.id)
          @lending_item_ids.push(@history.item_id)
        end
      end
      @histories = History.where(id: @history_ids)
      @items = Item.where(id: @lending_item_ids)

      tmp = {}
      @histories.each_with_index do |history, i|
        tmp[i] = { :item_name => history.item.name, :amount => history.amount, :history_return_date => history.return_date, :result => 0 }
      end
      return tmp
    end

  end
end
