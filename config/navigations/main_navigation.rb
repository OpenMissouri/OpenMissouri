SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'main'

      primary.item :data_sets, 'Data Sets', data_sets_path
      primary.item :organizations, 'Agencies', organizations_path
      primary.item :blog, 'Blog', "someblog"
      primary.item :about, 'About', about_path
      
  end
end