class CreateTableActions < ActiveRecord::Migration[5.0]
  def self.up
    create_table :actions do |t|
      t.column :user_id, :integer
      t.column :targetable_id, :integer
      t.column :targetable_type, :string
      t.column :type, :integer
    end
  end

  def self.down
  end
end
