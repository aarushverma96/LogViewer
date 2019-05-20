class BroadcastJob
  @queue = :default

  def self.perform(params, file_path, line_index = 0)
    # broadcasts updating file content

    # remaining number of lines
    remaining_lines = LogsHelper.get_total_lines(file_path) - line_index
    # content of updating file
    content, line_index = LogsHelper.read_lines(remaining_lines, file_path)
    # broadcasting message to development/test/production server
    ActionCable.server.broadcast(params[:env], {lines: content})

    LogsHelper.broadcast(params, file_path, line_index)
  end
end
