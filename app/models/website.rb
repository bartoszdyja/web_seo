class Website < ActiveRecord::Base
  validates_presence_of :name
  before_create :check_url

  def check_url 
    self.name = 'test'
  end
end
