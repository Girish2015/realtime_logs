class LogMessage

  def start_file_watch()

    current_line = send_logs_from_line_number(-1)

    listener = Listen.to('logs') do |modified, added, removed|
      puts current_line   
      current_line = send_logs_from_line_number(current_line)
    end
    listener.start
    sleep

  end
  handle_asynchronously :start_file_watch, :priority => 1

  def send_logs_from_line_number(current_line)

    File.foreach('logs/some_log_file.txt').with_index do |line, line_num|
      puts 'line_number :', line_num
      next if line_num <= current_line
      ActionCable.server.broadcast('log', message: line)
      current_line = line_num
    end
  
    return current_line
  end

end
