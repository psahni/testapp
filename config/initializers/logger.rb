class  Logger
  def format_message(severity, timestamp, progname, msg)
    "TEST LOGGER:: \033[1;37;40m#{  severity_color(severity) }\033[0m #{timestamp.to_formatted_s(:db)} #{msg}\n"
  end

  #def call(severity, time, progname, msg)
  #  "===============#{severity} #{String === msg ? msg : msg.inspect}\n"
  #end


  def severity_color(severity)
    case severity
      when "DEBUG"
        "\033[0;34;40m[DEBUG]\033[0m" # blue
      when "INFO"
        "\033[1;37;40m[INFO]\033[0m" # bold white
      when "WARN"
        "\033[1;33;40m[WARNING]\033[0m" # bold yellow
      when "ERROR"
        "\033[1;31;40m[ERROR]\033[0m" # bold red
      when "FATAL"
        "\033[7;31;40m[FATAL]\033[0m" # bold black, red bg
      else
        "[#{severity}]" # none
    end
  end


end



#Rails.application.config.logger = TestLogger.new(File.join(Rails.root, 'log/development.log'))