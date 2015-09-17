class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.float :response_time
      t.integer :status

      t.timestamps null: false
    end
  end
end
