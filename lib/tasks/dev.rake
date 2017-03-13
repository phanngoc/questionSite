include Rails.application.routes.url_helpers
include ActionView::Helpers::TagHelper

namespace :dev do
  desc "TODO"
  task seed_data_noti_redis: :environment do
    RedisService.new.del_pattern "noti_user_*"
    User.all.each do |user|
      question = Question.all.sample(1)[0]
      eUser = content_tag(:a, user.name, href: user_path(user.id))
      teaser = "request to answer "
      eQuestion = content_tag(:a, question.title, href: question_path(question.id))
      content_noti = content_tag(:div, "#{eUser} #{teaser} #{eQuestion}", class: "noti-it")
  
      noti = {content: "#{content_noti}", 
        time: Time.now.to_i,
        is_read: 0,
        url: question_path(question.id)}
      RedisService.new.add_noti user.id, noti 

      userRand = User.all.sample(1)[0]

      request_params = {actionable_id: userRand.id, actionable_type: Action.target_acts[:user],
        user_id: user.id, type_act: Action.type_acts[:request],
        param: {question_id: question.id}}

      action = Action.create request_params
    end
  end

  task :seed_data_noti_redis_for_user,[:user_id] => :environment do |t, args|
    RedisService.new.del_pattern "noti_user_*"
    seedData = Action.where("JSON_EXTRACT(`param` , '$.type') = ?", "seed")
    seedData.destroy_all

    user = User.find args[:user_id]
    10.times do
      question = Question.all.sample(1)[0]
      eUser = content_tag(:a, user.name, href: user_path(user.id))
      teaser = "request to answer "
      eQuestion = content_tag(:a, question.title, href: question_path(question.id))
      content_noti = content_tag(:div, "#{eUser} #{teaser} #{eQuestion}", class: "noti-it")
      
      userRand = User.all.sample(1)[0]

      request_params = {actionable_id: userRand.id, actionable_type: Action.target_acts[:user],
        user_id: user.id, type_act: Action.type_acts[:request],
        param: {question_id: question.id, type: "seed"}}

      action = Action.create request_params

      noti = {
        id: action.id,
        content: "#{content_noti}", 
        time: Time.now.to_i,
        is_read: 0,
        url: question_path(question.id)}
      RedisService.new.add_noti user.id, noti 
    end
  end

end
