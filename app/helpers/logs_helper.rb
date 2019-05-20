module LogsHelper
  class << self
    def read_lines(lines, file_path)
      content = `tail -n #{lines} #{file_path}`.split(/\n/)
      line_index = get_total_lines(file_path)
      [content, line_index]
    end

    def get_total_lines(file_path)
      `wc -l #{file_path}`.split.first.to_i
    end

    def broadcast(params, file_path, line_index)
      Resque.enqueue(BroadcastJob, params, file_path, line_index)
    end

  end
end
