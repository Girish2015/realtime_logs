class LogChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'log'
  end

  def receive
    puts params
  end

  def unsubscribed
    
  end
end