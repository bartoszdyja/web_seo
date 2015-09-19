class WebsiteWorker
  include Sidekiq::Worker 

  def perform(id)
    puts 'checking'
    website = Website.find(id)
    website.check_status
  end
end