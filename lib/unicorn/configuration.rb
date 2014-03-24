module Unicorn::WorkerKiller
  class Configuration
    attr_accessor :max_quit, :max_term, :sleep_interval, :app_callback

    def initialize
      self.max_quit = 10
      self.max_term = 15
      self.sleep_interval = 1
      self.app_callback = nil
    end

    def callback(sig, pid, trial)
      self.app_callback.call(sig, pid, trial) unless self.app_callback.nil?
    end
  end
end
