class API < Grape::API
  format :json

  resource :items do

   # User.where(uid: "takamatsu")
   user = User.where(uid: params[users][uid])
   
    get '/history/lend' do {
      name: user.history
      # name: "@users.name",
      # amount: "@histories.amount",
      # return_date: "@histories.return_date"
    } 
    end

    get '/url' do {
      url: "history_return_add_path(id: uid)"
    }
    end

    get '/result' do {
      resulte: "/user/mainpage/(id: uid)"
    }
    end

  end

end


    # get '/history/lend' do {
    #   name: "user.name",
    #   amount: "history.amount",
    #   return_date: "history.return_date"
    # }
    # end

    # get '/url' do {
    #   url: "history_return_add_path(id: uid)",
    # }
    # end

    # get '/result' do {
    #   resulte: "/user/mainpage/(id: uid)"
    # }
    # end
