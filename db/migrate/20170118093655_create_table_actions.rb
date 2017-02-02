class CreateTableActions < ActiveRecord::Migration[5.0]
  def self.up
    create_table :actions do |t|
      t.column :user_id, :integer
      t.column :actionable_id, :integer
      t.column :actionable_type, :string
      t.column :type_act, :integer
    end
  end

  def self.down
  end
end
