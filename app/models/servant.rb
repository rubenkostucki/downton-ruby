class Servants <ActiveRecord::Base

  attr_accessible :last_name, :age, :occupation
  validates_presence_of :last_name, :age
  validates :age, :inclusion => 16..100

  validates :occupation, :inclusion => ["Butler", "Maid", "Cook"]

end