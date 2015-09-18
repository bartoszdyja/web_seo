class Response < ActiveRecord::Base
  belongs_to :user

  def readable_status  
    if status
      if status.between?(0,400)
        'Online'
      else
        'Offline'
      end
    else
      'N/A'
    end
  end


end
