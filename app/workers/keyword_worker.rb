class KeywordWorker
  include Sidekiq::Worker 

  def perform(id)
    @keyword = Keyword.find(id)
    @keyword.check_position
    puts @keyword.check_position
    @keyword.positions.create!(position: @keyword.check_position)
    #puts @keyword.name
    #puts @keyword.website.name
    # page = Nokogiri::HTML(open('http://www.google.com/search?num=10&q='+@keyword.name))
    # page.search("cite").each_with_index do |l, index|
    #   #puts "#{index} #{l.content}"
    #   return @position = index+1 if l.content.include?(strip_url(@keyword.website.name))
    # end
    # puts 'supa'
  end


end