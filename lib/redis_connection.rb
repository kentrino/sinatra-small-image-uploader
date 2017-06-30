class RedisConnection
  CONFIG = Application::REDIS_CONFIG
  POOL_SIZE = CONFIG[:pool]

  class << self
    def conn
      init_if_needed
      @round_robin_index = (@round_robin_index + 1) % POOL_SIZE
      @connections[@round_robin_index]
    end

    private
    def init_if_needed
      @connections ||= []
      @round_robin_index ||= 0
      if @connections.size == POOL_SIZE
        return
      end
      POOL_SIZE.times do |i|
        @connections[i] = Redis.new(CONFIG)
      end
    end
  end
end
