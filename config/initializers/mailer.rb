ActionMailer::Base.default_url_options[:host] = configatron.host


ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",  
  :user_name            => "mail@openmissouri.org",  
  :password             => "openmomail",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}

