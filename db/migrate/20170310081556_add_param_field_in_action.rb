class AddParamFieldInAction < ActiveRecord::Migration[5.0]
  def change
    add_column :actions, :param, :json
  end
end
