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
  
  def sunshine_letter_text(data_set, user=nil, escaped=true, output="html")
    txt = ""
    
    if user
      txt << "#{user.full_name}#{linebreak(output)}"
      txt << "#{address_block(user.street1, user.street2, user.city, user.state, user.postal_code, output)}"
      txt << "#{user.phone}#{linebreak(output)}#{linebreak(output)}"
      
    end  
    
    txt << "#{Time.now.strftime("%B %d, %Y")}"
    
    txt << "#{linebreak(output)}#{linebreak(output)}#{data_set.organization.sunshine_contact}"
    
    unless data_set.organization.sunshine_title.blank?
      txt << "#{linebreak(output)}#{data_set.organization.sunshine_title}"
    end
    
    unless data_set.organization.governement_entity_name.blank?
      txt << "#{linebreak(output)}#{data_set.organization.governement_entity_name}"
    end
    
    unless data_set.organization.name.blank?
      txt << " #{data_set.organization.name}"
    end
    
    txt << "#{linebreak(output)}#{address_block(data_set.organization.address1, data_set.organization.address2, data_set.organization.city, data_set.organization.state, data_set.organization.postal_code, output)}" 
    txt << "#{linebreak(output)}#{linebreak(output)}Dear #{data_set.organization.sunshine_contact ? data_set.organization.sunshine_contact : "[contact name]" }:"
    txt << "#{linebreak(output)}#{linebreak(output)}Under the Missouri Sunshine Law (RSMo Chapter 610), I request in electronic form a copy of your agency's #{data_set.name} database for {SPECIFY THE TIME PERIOD THAT YOUR DATA COVERS}."
    txt << "#{linebreak(output)}#{linebreak(output)}I understand that the data is stored in #{data_set.data_format} format. Please provide the data to me in that format {OR IN ANOTHER FORMAT SPECIFICED BY YOU, SUCH AS DELIMITED TEXT, OR MICROSOFT EXCEL}. In addition, I request copies of any documentation that I'll need to understand the data."
    txt << "#{linebreak(output)}#{linebreak(output)}Please contact me if you have any questions about my request. I will be happy to work with you to fill this request quickly. Feel free to contact me at my phone number, which is listed at the head of this letter."
    txt << "#{linebreak(output)}#{linebreak(output)}You can email the files to me at #{user ? user.email : "[your email address]"} or mail them to my address above."
    txt << "#{linebreak(output)}#{linebreak(output)}If you deny any or all of this request, you are required to do so in writing. In your letter, please cite the laws that allow you to deny any information."
    txt << "#{linebreak(output)}#{linebreak(output)}OPTIONAL FEE LIMIT/WAIVER LANGUAGE:"
    txt << "#{linebreak(output)}I am willing to pay fees up to [insert amount here] to fill this request. Please contact me if the fees will exceed this amount."
    txt << "#{linebreak(output)}#{linebreak(output)}I request a fee waiver. The release of this data is in the public interest because it is likely to contribute significantly to public understanding of the operations or activities of the public governmental body and is not primarily for my own commercial interest."
    txt << "#{linebreak(output)}#{linebreak(output)}I look forward to your response within three working days, as required by the Sunshine Law."
    txt << "#{linebreak(output)}#{linebreak(output)}Sincerely,"
    txt << "#{linebreak(output)}#{user ? user.full_name : "[Your Name]" }"
    
    if escaped
      escape_javascript(txt)
    else
      raw(txt)
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
  
  def linebreak(output)
    output == "text" ? "\n" : "<br />" 
  end
  
  def address_block(address, address2, city, state, postal_code, output="html")
    loc = ""
    if address and not address.empty?
      loc << "#{address}#{linebreak(output)}"
    end
    
    if address2 and not address2.empty?
      loc << "#{address2}#{linebreak(output)}"
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
      loc << "#{city_state}#{linebreak(output)}"
    end
    
    loc ? raw(loc) : "No address information is available."
  end
  
end
