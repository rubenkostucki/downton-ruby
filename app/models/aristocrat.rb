class Aristocrat < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email
  validates(:first_name, :last_name, :presence => true)

  validates(:last_name, :length => { :minimum => 10, :message => "You are not one of us" },
             :format => { :with => /^[a-zA-Z']+-[a-zA-Z']+$/ })
  validates(:email, :format => { :with => /@/ })

end
