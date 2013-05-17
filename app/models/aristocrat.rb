class Aristocrat < ActiveRecord::Base


  has_many :servants
  has_and_belongs_to_many :club
  attr_protected :first_name, :surname, :email
  validates(:first_name, :surname, :presence => true)

  validates(:surname, :length => { :minimum => 10, :message => "You are not one of us" }, :format => { :with => /^[a-zA-Z']+-[a-zA-Z']+$/ })

  validates(:email, :format => { :with => /@/ })


  def servants(age)

  end
end
