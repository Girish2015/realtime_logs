class RealtimeLogController < ApplicationController
  def index
    LogMessage.new().delay.start_file_watch()
  end

  # def test
  #   ActionCable.server.broadcast 'log',
  #     message: 'test message',
  #     user: 'some test user'
    
  #   render json: { 'working': true }
  # end
end