class RedisService
  def initialize
    @redis = Redis.new(host: "127.0.0.1", port: 6379)
  end

  def add_noti user_id, item
    @redis.zadd "noti_user_#{user_id}", Time.now.to_i, item.to_json
  end

  def noti_user user_id
    @redis.zrangebyscore("noti_user_#{user_id}", "0", "(#{Time.now.to_i}").reverse

  end

  def update_noti_isread noti_id, user_id
    datanoti = @redis.zrange("noti_user_#{user_id}", 0, -1, with_scores: true)
    resArr = []
    datanoti.each do |noti, key|
      objNoti = JSON.parse noti
      if objNoti["id"].to_s == noti_id
        objNoti["is_read"] = 1;
        content = ActiveSupport::JSON.encode(objNoti)
        resArr << [key, content]
      else
        resArr << [key, noti]
      end
    end
    self.del_pattern "noti_user_#{user_id}"
    @redis.zadd("noti_user_#{user_id}", resArr)
    resArr.map!{|ar| ar[1]}
    return {status: Settings.status.ok, data: resArr}
  end

  def get_user_popular_topic topic_id
    @redis.zrange("popular_topic_#{topic_id}", 0, -1)
  end

  def del_pattern pattern
    keys = @redis.keys "#{pattern}"
    @redis.del(*keys) unless keys.empty?
  end
end
