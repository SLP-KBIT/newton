class HistoryController < ApplicationController
  def index
    @histories = History.all
  end

  def show
    @history = History.where(id: params[:id]).first
  end

  def lend_add
    @items = Item.all
    @history = History.new
    @array2 = []
    @items.each do |item|
      @array1 = Array.new
      (1..item.amount).each do |i|
        @array = Array.new
        @array.push(i)
        @array.push(i)
        @array1.push(@array)
      end
      @array2.push(@array1)
    end
  end

  def lend_create
    STDERR.puts params.inspect
#-----------------------------------
#    params.each do |key,value|
#      if /^[0-9]/ =~ key.to_s
##        @history = HIstory.new()
##        @history = History.new(user_id: 1, item_id: key, status: 0, amount: value[:amount], detail_id: 0)
#        @history = History.new(user_id: 1, item_id: key, status: 0, amount: value[:amount], failure_detail: "hoge", detail_id: 0)
#        @result = @history.save
#      end
#    end
#-----------------------------------
#    @item = params[:item].select do |key,value|
#      key.include? "item_"
#    end
    @item = params[:item]
    @item.each do|key, value|
      puts "#{key}, #{value}\n"
      item = Item.where(id: key.to_i).first
      # @result = item.histories.create(user_id: 1, status: 0, amount: value.to_i, failure_detail: "hoge", detail_id: 0)
      @history = History.new(user_id: 1, item_id: key.to_i, status: 0, amount: value.to_i, failure_detail: "hoge", detail_id: 0)
      @result = @history.save
      redirect_to action: :lend_add and return if @result.blank?      
    end      

#    @history = History.new(params.require(:history).permit(:item_id, :status, :amount, :failure_detail, :detail_id))
    p @result
    redirect_to :controller => 'user', :action => 'mainpage', :id => 1 and return if @result
    redirect_to action: :lend_add
    
    #redirect_to :action => 'mainpage', :id => 1
  end

end
