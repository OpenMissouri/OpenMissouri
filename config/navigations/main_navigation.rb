SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'main'
      primary.item :home, 'Home', root_path
      primary.item :data_sets, 'Data Sets', data_sets_path
      primary.item :organizations, 'Agencies', organizations_path
      primary.item :blog, 'Blog', "http://blog.openmissouri.org"
      primary.item :about, 'About', about_path
      
  end
end