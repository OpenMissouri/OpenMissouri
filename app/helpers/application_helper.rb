module ApplicationHelper
  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end
  
  def first_x_words(str,n=20,finish='&hellip;')
     "#{str.split(' ')[0,n].inject{|sum,word| sum + ' ' + word}}#{finish}"
  end
  
  def format_url(url)
    url.include?( "http://" )? url : "http://#{url}"
  end
  
  def format_date(date,format=:short)
    case format
      when "countdown"
        "#{date.month}/#{date.day}#{date.strftime("/%Y")}" if date
      when "short"
        "#{date.month}/#{date.day}#{date.strftime("/%Y")}" if date
      when "verbose"
        "#{date.strftime("%w")} #{date.month}/#{date.day}#{date.strftime("/%Y")}" if date
      else  
        "#{date.month}/#{date.day}#{date.strftime("/%Y")}" if date
    end
  end

  def format_time(time)
    "#{time.strftime("%I").to_i.to_s}:#{time.strftime("%M")} #{time.strftime("%p")}" if time
  end
  
  def format_time_short(time)
    minutes = time.min == 0 ? "" : ":#{time.strftime("%M")}"
    "#{time.strftime("%I").to_i.to_s}#{minutes}#{time.strftime("%p").downcase}"
  end
  
  def address_block(address, address2, city, state, postal_code)
    loc = ""
    if address and not address.empty?
      loc << "#{address}<br />"
    end
    
    if address2 and not address2.empty?
      loc << "#{address2}<br />"
    end
    
    city_state = ""
    if city and not city.empty?
      city_state << city
      if state and not state.empty?
        city_state << ", #{state}"
      end
    elsif state and not state.empty?
      city_state << state
    end
    if postal_code and not postal_code.empty?
      city_state << " #{postal_code}"
    end
    if city_state and not city_state.empty?
      loc << "#{city_state}<br />"
    end
    
    loc ? loc : "No address information is available."
  end
  
end
