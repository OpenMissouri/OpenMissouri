xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Open Missouri"
    xml.description "Connecting you to state and local government data."
    xml.link data_sets_url

    for data_set in @data_sets
      xml.item do
        xml.title data_set.name
        xml.description data_set.description
        xml.pubDate data_set.created_at.to_s(:rfc822)
        xml.link data_set_url(data_set)
        xml.guid data_set_url(data_set)
      end
    end
  end
end
