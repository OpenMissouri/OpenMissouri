SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false
  
  navigation.items do |user|
    user.dom_class = 'user'
    user.item :search, "#{image_tag('/images/icons/search.png', :style => "float: left; margin-right: 3px; padding-top: 1px")} Search Open Missouri", search_path
    user.item :contact, 'Contact Us', '/contact'
    if user_signed_in?
      if current_user.admin? 
        user.item :admin, 'Admin', '/admin'
  		end
      user.item :account, current_user.full_name, edit_user_registration_path
      user.item :sign_out, 'Sign out', destroy_user_session_path
    else
      user.item :sign_in, 'Sign in', new_user_session_path
      user.item :sign_up, 'Sign up', new_user_registration_path
    end
  end
end