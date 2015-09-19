class Website < ActiveRecord::Base
  validates_presence_of :name
  after_create :check_status
  has_many :responses, dependent: :destroy
  belongs_to :user

  def check_status    
    begin                                                                                                                                                                                                                                                                                    
      start_time = Time.now
      response = Faraday.get name
      response_time = Time.now - start_time
      responses.create(response_time: response_time, status: response.status)
    rescue Faraday::Error::ConnectionFailed => e
      responses.create(response_time: nil, status: 503)
      return
    end

  end



end
                                                                                                                                                                      