ActionMailer::Base.default_url_options[:host] = configatron.host


ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "openmissouri.org",  
  :user_name            => "openmissouri",  
  :password             => "something",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}