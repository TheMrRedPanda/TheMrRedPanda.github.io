begin
  require 'terminal-notifier'
  module Jekyll
    class Site
      alias jekyll_process process
      def process
        jekyll_process
        TerminalNotifier.notify("🍻 Сайт обновлен ")
      rescue => e
        TerminalNotifier.notify("💥 Ошибка обновления сайта: #{e.message}")
        raise e
      end
    end
  end
rescue LoadError
  # nothing
end
