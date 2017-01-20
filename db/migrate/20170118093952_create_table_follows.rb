class CreateTableFollows < ActiveRecord::Migration[5.0]
  def self.up
    create_table :table_follows do |t|
      t.column :user_id, :integer
      t.column :followable_id, :integer
      t.column :followable_type, :string
      t.timestamps
    end
  end

  def self.down
  end
end
