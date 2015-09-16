class Website < ActiveRecord::Base
  validates_presence_of :name
  after_create :check_status

  def check_status
    start_time = Time.now
    response = Faraday.get name
    response_time = Time.now - start_time
    update(response_time: response_time)
  end

end
