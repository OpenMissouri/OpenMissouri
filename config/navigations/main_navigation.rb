SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'main'

    primary.with_options(:if => Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :data_sets, 'Browse Data', data_sets_path
      signed_in_user.item :organizations, 'Agencies', organizations_path
      signed_in_user.item :blog, 'Blog', "someblog"
      signed_in_user.item :about, 'About', about_path
      
    end
  end
end