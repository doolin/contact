
Factory.define :email_contact do |ec|
  ec.name "Dave Doolin"
  ec.email "david.doolin2@gmail.com"
  ec.subject "testing the contact mailer"
  ec.message "The test message"
end

Factory.define :admin do |a|
  a.email    "david.doolin2@gmail.com"
  a.password "foobar"
end
