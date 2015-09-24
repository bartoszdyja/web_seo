require 'open-uri'
class Keyword < ActiveRecord::Base
  belongs_to :website
  after_create :check_position

  def check_position
    page = Nokogiri::HTML(open('http://www.google.com/search?num=10&q='+name))
    puts name
    puts website.name
    page.search("cite").each_with_index do |l, index|
      puts "#{index} #{l.content}"
      return index+1 if l.content.include?(strip_url(website.name))
    end
    return
  end


  def strip_url(name)
    name.sub(/http:\/\/www./,'')
  end

end
