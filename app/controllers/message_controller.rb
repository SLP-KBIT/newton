class MessageController < ApplicationController
  def index
    @messages = Message.all
  end

  def add
    @messages = Message.new
  end
end
