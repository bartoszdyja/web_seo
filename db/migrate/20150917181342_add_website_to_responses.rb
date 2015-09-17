class AddWebsiteToResponses < ActiveRecord::Migration
  def change
    add_reference :responses, :website, index: true, foreign_key: true
  end
end
