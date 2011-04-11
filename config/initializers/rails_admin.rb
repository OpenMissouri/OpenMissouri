RailsAdmin.config do |config|
  config.navigation.max_visible_tabs 7
  
  config.model UserIdentity do
    navigation do
      visible false
    end
  end

  config.model Category do
    list do
      sort_by :name
      sort_reverse { false }
    end
  end

  config.model DataSet do
    list do
      sort_by :name
      sort_reverse { false }
    end
    
    edit do
      group :comments do
        hide
      end

    end
  end

  config.model Organization do
    list do
      sort_by :name
      sort_reverse { false }
    end
  end

  config.model GovernmentLevel do
    list do
      sort_by :name
      sort_reverse { false }
    end
  end

  config.model User do
    list do
      sort_by :full_name
      sort_reverse { false }
    end
  end
  
  config.model Page do
    edit do
      field :name
      field :section
      field :sort
      field :body do
        ckeditor true
      end
    end
  end
  
end

