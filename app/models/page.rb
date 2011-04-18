class Page < ActiveRecord::Base
  
  
  def to_param
		"#{id}-#{title.gsub(/[^a-z0-9]+/i, '-').downcase}"
	end
	
end
