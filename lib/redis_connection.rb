class RedisConnection
  #include Singleton
  CONFIG = Application::REDIS_CONFIG
  POOL_SIZE = CONFIG[:pool]
end

connections = []
round_robin_index = 0

RedisConnection.define_singleton_method :init_conn do
  RedisConnection::POOL_SIZE.times do |i|
    connections[i] = Redis.new(RedisConnection::CONFIG)
  end
end

RedisConnection.define_singleton_method :conn do
  if connections.size != RedisConnection::POOL_SIZE
    init_conn
  end
  round_robin_index = (round_robin_index + 1) % RedisConnection::POOL_SIZE
  connections[round_robin_index]
end
