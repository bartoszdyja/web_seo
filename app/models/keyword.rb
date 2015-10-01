require 'open-uri'
class Keyword < ActiveRecord::Base
  belongs_to :website
  after_commit :check_position_async

  def check_position_async
    KeywordWorker.perform_async(id)
  end

  def check_position
    @position=0
    page = Nokogiri::HTML(open('http://www.google.com/search?num=10&q='+name))
    page.search("cite").each_with_index do |l, index|
      #puts "#{index} #{l.content}"
      @position+=1
      #puts l.content.include?(strip_url(website.name))
      return @position if l.content.include?(strip_url(website.name))
    end
    nil
    
  end
  
  def strip_url(name)
    name.sub(/http:\/\/www./,'')
  end

end
