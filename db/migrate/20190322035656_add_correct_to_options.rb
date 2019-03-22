class AddCorrectToOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :options, :correct, :boolean, default: false
  end
end
