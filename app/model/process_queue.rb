class ProcessQueue
  REDIS_KEY_FILELIST = 'filelist'
  SEPARATOR = ':'

  class << self
    def add(filepath)
      not_processed = '0'

      RedisConnection.conn.lpush(REDIS_KEY_FILELIST, filepath + SEPARATOR + not_processed)
    end

    def get()
      filelist = RedisConnection.conn.lrange(REDIS_KEY_FILELIST, 0, -1) || []
      filelist.map! do |e|
        elem = e.split(SEPARATOR)
        { file: elem[0], processed: elem[1] }
      end
    end
  end
end
