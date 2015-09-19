class Website < ActiveRecord::Base
  validates_presence_of :name
  validate :validate_url
  
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
      errors.add(:connection, "is not available. We'll try to reach your domain later")
      return
    end
  end

  

  def validate_url
    #errors.add(:URL, "is not valid")
  end

end
                                                                                                                                                                      