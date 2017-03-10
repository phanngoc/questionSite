class RedisService
  def initialize 
    @redis = Redis.new(host: "127.0.0.1", port: 6379)
  end

  def add_noti user_id, item
    @redis.zadd "noti_user_#{user_id}", Time.now.to_i, item.to_json
  end

  def noti_user user_id, time_ago
    @redis.zrangebyscore("noti_user_#{user_id}", time_ago)
  end

  def get_user_popular_topic topic_id
    @redis.zrange("popular_topic_#{topic_id}", 0, -1)
  end
end