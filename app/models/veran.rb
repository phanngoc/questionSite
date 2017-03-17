class Veran < ApplicationRecord
  self.table_name = "version_answers"
  belongs_to :question, foreign_key: "answer_target"

  belongs_to :user

  enum status: {pending: 0, approved: 1, rejected: 2}

  scope :by_an, -> answer_id{where answer_target: answer_id}

  scope :status, -> status{where status: status}

  class << self
    def find_newest answer_id
      where(answer_target: answer_id, status: Veran.statuses[:approved])
      .order(version: :desc).first
    end

    def version_by_ansid answer_id
      where(answer_target: answer_id, status: Veran.statuses[:approved])
    end

    def max_ver
      ver_max = Veran.maximum("version")
      ver_max.nil? ? 0 : ver_max
    end
  end
end
