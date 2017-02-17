class Verque < ApplicationRecord
  self.table_name = "version_questions"
  belongs_to :question, foreign_key: "question_target"
  
  belongs_to :user

  enum status: {pending: 0, approved: 1, rejected: 2}

  scope :by_ques, -> ques_id{where question_target: ques_id}

  scope :status, -> status{where status: status}

  class << self
    def find_newest question_id
      where(question_target: question_id, status: Verque.statuses[:approved])
      .order(version: :desc).first
    end

    def version_by_quesid question_id
      where(question_target: question_id, status: Verque.statuses[:approved])
    end

    def max_ver
      ver_max = Verque.maximum("version")
      ver_max.nil? ? 0 : ver_max
    end
  end  
end
