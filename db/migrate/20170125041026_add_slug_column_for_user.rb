class AddSlugColumnForUser < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :slug, :string
  end

  def self.down
    remove_column :users, :slug, :string
  end
end
