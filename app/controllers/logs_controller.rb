class LogsController < ApplicationController

  def index
    file_name = "#{params[:env]}.log"
    file_path = Rails.root.join("log/#{file_name}")
    @last_ten_lines, line_index = LogsHelper.read_lines(10,file_path)
    render :index
    Resque.enqueue(BroadcastJob, params, file_path, line_index)
  end
end
