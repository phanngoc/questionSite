class CreateTableQuestionsTopics < ActiveRecord::Migration[5.0]
  def self.up
    create_table :questions_topics do |t|
      t.column :question_id, :integer
      t.column :topic_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :questions_topics
  end
end
