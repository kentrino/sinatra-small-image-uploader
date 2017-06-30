class FileProcessQueue
  REDIS_KEY_FILELIST_TO_PROCESS = 'filelist_to_process'
  NOT_PROCESSED = 0

  class << self
    def add(filepath)
      RedisConnection.conn.hset(REDIS_KEY_FILELIST_TO_PROCESS, filepath, NOT_PROCESSED)
    end

    def get()
      # ZRANGEBYSCORE is better?
      filelist = RedisConnection.conn.hkeys(REDIS_KEY_FILELIST_TO_PROCESS) || []
      filelist.map! do |file|
        { file: file }
      end
    end
  end
end
