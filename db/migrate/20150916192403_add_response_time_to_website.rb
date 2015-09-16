class AddResponseTimeToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :response_time, :float
  end
end
