module RailsAdmin
#  class History < ActiveRecord::Base
#    set_table_name :rails_admin_histories
#
#    IGNORED_ATTRS = Set[:id, :created_at, :created_on, :deleted_at, :updated_at, :updated_on, :deleted_on]
#
#    scope :most_recent, lambda {|table|
#      where("#{retrieve_connection.quote_column_name(:table)} = ?", table).order("updated_at")
#    }
#
#    def self.get_history_for_dates(mstart, mstop, ystart, ystop)
#      sql_in = ""
#      if mstart > mstop
#        # fix by Dan Choi
#        #sql_in = (mstart + 1..12).to_a.join(", ") <== possible culprit May month bug
#        sql_in = (mstart..12).to_a.join(", ")
#        sql_in_two = (1..mstop).to_a.join(", ")
#
#        results = History.find_by_sql("select count(*) as number, year, month from rails_admin_histories where month IN (#{sql_in}) and year = #{ystart} group by year, month")
#        results_two = History.find_by_sql("select count(*) as number, year, month from rails_admin_histories where month IN (#{sql_in_two}) and year = #{ystop} group by year, month")
#
#        results.concat(results_two)
#      else
#        #sql_in =  (mstart + 1..mstop).to_a.join(", ")  <=== may be defective too
#        sql_in =  (mstart..mstop).to_a.join(", ")
#
#        results = History.find_by_sql("select count(*) as number, year, month from rails_admin_histories where month IN (#{sql_in}) and year = #{ystart} group by year, month")
#      end
#
#      results.each do |result|
#        result.number = result.number.to_i
#      end
#
#      add_blank_results(results, mstart, ystart)
#    end
#
#    def self.add_blank_results(results, mstart, ystart)
#      # fill in an array with BlankHistory
#      blanks = Array.new(5) { |i| BlankHistory.new(((mstart+i) % 12)+1, ystart + ((mstart+i)/12)) }
#      # replace BlankHistory array entries with the real History entries that were provided
#      blanks.each_index do |i|
#        if results[0] && results[0].year == blanks[i].year && results[0].month == blanks[i].month
#          blanks[i] = results.delete_at 0
#        end
#      end
#    end
#  end
#end

  RailsAdmin.config do |config|
    
    config.excluded_models << "UserIdentity"
  
#  config.model UserIdentity do
#      visible false
#  end
#  
#  
#  config.model Category do
#    list do
#      sort_by :name
#      sort_reverse false 
#    end
#  end
#
  config.model DataSet do
    list do
      sort_by :name
      sort_reverse false 
      
      #field :samplefile_file_name do
      #  formatted_value do
      #    bindings[:view].tag(:link, { :href => bindings[:object].samplefile.url }) << value
      #  end
      #end
      
    end
    
    edit do
      group :comments do
        hide
      end

    end
  end
  
  config.model SunshineRequest do
    list do
      field :data_set
      field :first_name
      field :last_name 
      field :agency_name
      field :entity_name
      field :created_at
      
      
    end
  end
#
#  config.model Organization do
#    list do
#      sort_by :name
#      sort_reverse false 
#    end
#  end
#
#  config.model GovernmentLevel do
#    list do
#      sort_by :name
#      sort_reverse false 
#    end
#  end
#
#  config.model User do
#    list do
#      sort_by :full_name
#      sort_reverse false 
#    end
#  end
#  
#  config.model Page do
#    
#    list do
#      sort_by :sort
#      sort_reverse false 
#      
#      field :title
#      field :section
#      field :sort
#      field :published
#    end
#    
#    #this is arbitrary
#    
#    edit do
#      
#       
#    end
  end
  
end