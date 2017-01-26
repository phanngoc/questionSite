class ChangeTableTopicAndAnswersAndAddTopicUsers < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :table_answers, :answers
    rename_table :table_follows, :follows

    create_table :user_topics do |t|
      t.column :user_id, :integer
      t.column :topic_id, :integer
      t.timestamps
    end

  end

  def self.down
    rename_table :answers, :table_answers
    rename_table :follows, :table_follows

    drop_table :user_topics
  end
end
