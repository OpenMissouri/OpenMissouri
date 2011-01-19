# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :organization do |f|
  f.name "MyString"
  f.government_level "MyString"
  f.governement_entity_name "MyString"
  f.agency_head "MyString"
  f.sunshine_contact "MyString"
  f.sunshine_title "MyString"
  f.sunshine_phone "MyString"
  f.sunshine_email "MyString"
  f.accepts_email_requests false
  f.website "MyString"
  f.description "MyText"
  f.openness_rating "MyString"
  f.address1 "MyString"
  f.address2 "MyString"
  f.city "MyString"
  f.state "MyString"
  f.postal_code "MyString"
  f.notes "MyString"
  f.fax "MyString"
  f.user_id 1
end
