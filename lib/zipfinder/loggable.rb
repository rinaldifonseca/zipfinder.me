module ZipFinder
  module Loggable
    private

    def log(message, logger = ZipFinder.logger)
      logger << "#{message}\n" if logger
    end
  end
end
