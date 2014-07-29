# -*- coding: utf-8 -*-
class API < Grape::API
  format :json

  resource 'history/lend' do
    desc "貸出中の物品情報を返す"

    params do
      requires :uid, type: String, desc: 'User ID.'
    end

    get do
      user = User.where( uid: params[:uid] ).first
      return { result: 'unknown user' } if user.nil?

      item_ids = user.histories.order( :created_at ).pluck( :item_id ).uniq
      histories = user.histories.where.not('type = ?', 'ReserveHistory')
      history_ids = []

      item_ids.each do |id|
        history = histories.where( item_id: id ).order( created_at: :desc ).first
        if history.present? && history.type == 'LendHistory'
          history_ids.push history.id
        end
      end
      histories = History.where( id: history_ids )

      items = []
      histories.each do |history|
        items.push( { name: history.item.name, amount: history.amount, return_date: history.return_date } )
      end

      {
        items: items,
        url: "http://#{request.host_with_port}/user/mainpage/#{user.id}",
        result: 'success'
      }
    end
  end
end
