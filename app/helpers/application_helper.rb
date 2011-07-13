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
  
  def sunshine_letter_text(data_set, user=nil, escaped=true)
    txt = ""
    
    if user
      txt << "#{user.full_name}\n"
      txt << "#{address_block(user.street1, user.street2, user.city, user.state, user.postal_code)}\n"
      txt << "#{Time.now.strftime("%B %d, %Y")}\n"
      txt << "#{user.full_name}\n"
    end  
    
    txt << "#{data_set.organization.sunshine_contact}\n"
    
    unless data_set.organization.sunshine_title.blank?
      txt << "\n#{data_set.organization.sunshine_title}"
    end
    
    unless data_set.organization.governement_entity_name.blank?
      txt << "\n#{data_set.organization.governement_entity_name}"
    end
    
    unless data_set.organization.name.blank?
      txt << "\n#{data_set.organization.name}"
    end
    
    txt << "\n#{address_block(data_set.organization.address1, data_set.organization.address2, data_set.organization.city, data_set.organization.state, data_set.organization.postal_code)}" 
    txt << "\n\nDear #{data_set.organization.sunshine_contact ? data_set.organization.sunshine_contact : "[contact name]" }:"
    txt << "\n\nUnder the Missouri Sunshine Law (RsMO Chapter 610), I request in electronic form a copy of your agency's #{data_set.name} database. {SPECIFY THE TIME PERIOD THAT YOUR DATA COVERS}"
    txt << "\n\nI understand that the data is stored in #{data_set.data_format} format. Please provide the data to me in that format {OR IN ANOTHER FORMAT SPECIFICED BY YOU, SUCH AS DELIMITED TEXT, OR MICROSOFT EXCEL}. In addition, I request copies of any documentation that I'll need to understand the data."
    txt << "\n\nPlease contact me if you have any questions about my request. I will be happy to work with you to fill this request quickly. Feel free to contact me at my phone number, which is listed at the head of this letter."
    txt << "\n\nYou can email the files to me at #{user ? user.email : "[your email address]"} or mail them to my address above."
    txt << "\n\nIf you deny any or all of this request, you are required to do so in writing and cite your specific legal authority."
    txt << "\n\nOPTIONAL FEE LIMIT/WAIVER LANGUAGE:"
    txt << "\nI am willing to pay fees up to [insert amount here] to fill this request. Please contact me if the fees will exceed this amount."
    txt << "\n\nI request a fee waiver. The release of this data is in the public interest because it is likely to contribute significantly to public understanding of the operations or activities of the public governmental body and is not primarily for my own commercial interest."
    txt << "\n\nI look forward to your response within three working days, as required by the Sunshine Law."
    txt << "\n\nSincerely,"
    txt << "\n#{user ? user.full_name : "[Your Name]" }"
    
    if escaped
      escape_javascript(txt)
    else
      txt
    end
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
    
    loc ? raw(loc) : "No address information is available."
  end
  
end
