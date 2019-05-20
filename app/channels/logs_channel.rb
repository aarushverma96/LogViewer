class LogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{params['env']}"
  end
end
