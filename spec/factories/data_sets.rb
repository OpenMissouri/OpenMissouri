# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :data_set do |f|
  f.organization_id 1
  f.user_id 1
  f.name "MyString"
  f.description "MyString"
  f.data_format "MyString"
  f.cost "MyString"
  f.period_start_date "2011-01-12 13:57:19"
  f.period_end_date "2011-01-12 13:57:19"
  f.update_frequency "MyString"
  f.notes "MyText"
  f.website "MyString"
end
