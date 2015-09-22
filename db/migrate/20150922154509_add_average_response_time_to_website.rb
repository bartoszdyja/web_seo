class AddAverageResponseTimeToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :average_response_time, :decimal
  end
end
