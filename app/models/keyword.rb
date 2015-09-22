require 'open-uri'
class Keyword < ActiveRecord::Base
  belongs_to :website
  after_create :check_position

  def check_position
    page = Nokogiri::HTML(open('http://www.google.com/search?num=10&q=positionly'))

    page.search("cite").each do |l|
      if l.content.include?(strip_url(website.name))
        puts 'Found'
      end
    puts "res: #{l.content}"
    end
      puts strip_url(website.name)

  end

  def strip_url(name)
    name.sub(/http:\/\/www./,'')
  end

end
