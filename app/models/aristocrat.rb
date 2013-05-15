class Aristocrat < ActiveRecord::Base

  attr_protected :first_name, :surname, :email
  validates(:first_name, :surname, :presence => true)

  validates(:surname, :length => { :minimum => 10, :message => "You are not one of us" }, :format => { :with => /^[a-zA-Z']+-[a-zA-Z']+$/ })

  validates(:email, :format => { :with => /@/ })

end
