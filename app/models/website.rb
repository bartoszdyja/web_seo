class Website < ActiveRecord::Base
  validates_presence_of :name

  def check_status
    start_time = Time.now
    response = Faraday.get name
    response_time = Time.now - start_time
  end

end
