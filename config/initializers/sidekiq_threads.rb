Thread.new do
  while true
    Website.all.each do  |w|
       if w.responses.last.updated_at< 1.hour.ago
          WebsiteWorker.perform_async(w.id)
        end
       
    end
    sleep 600
  end
end