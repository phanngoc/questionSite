class PopularUserTopicJob < ApplicationJob
  queue_as :default

  def perform(*args)

    $redis = Redis.new(host: "127.0.0.1", port: 6379)
    keys = $redis.keys "popular_topic_*"
    $redis.del(*keys) unless keys.empty?

    Topic.all.each do |topic|
      resultQues = Topic.find_by_sql("
        select res.user_id, SUM(res.num) as numv, SUM(res.total_vote) as to_vo from (
          (select count(qu.id) as num, 
          qu.user_id,
          (SUM(qu.up_vote) - SUM(qu.down_vote)) as total_vote
          from questions qu inner join question_topics qt on qt.question_id = qu.id
          and qt.topic_id = #{topic.id}
          group by qu.user_id)
          
          UNION

          (select count(an.id) as num, 
          an.user_id,
          (SUM(an.up_vote) - SUM(an.down_vote)) as total_vote
          from answers an inner join questions qu on qu.id = an.reply_to
          inner join question_topics qt on qt.question_id = qu.id
          and qt.topic_id = #{topic.id})
        ) as res group by user_id order by numv desc, to_vo desc
        ")

      ques = resultQues.map{|item| item.user_id}.compact.each do |user_id|
        $redis.zadd("popular_topic_#{topic.id}", Time.now.to_i, user_id)      
      end
    end

  end
end
