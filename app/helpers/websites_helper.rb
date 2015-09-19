module WebsitesHelper
  def readable_time(time)
    if time
      time_ago_in_words(time) + ' ago'
    else
      'checking'
    end
  end
end
