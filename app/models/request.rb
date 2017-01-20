class Request < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :request, class_name: "User", foreign_key: "requester_id"
end
