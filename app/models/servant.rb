class Servant <ActiveRecord::Base

  attr_accessible :last_name, :age, :occupation
  validates_presence_of :last_name, :age
  validates :age, :inclusion => 16..100

  validates :occupation, :inclusion => ["Butler", "Maid", "Cook"]

  validates :nickname, :length => { :minimum => 6 }

  before_create :automatic_nickname

  def automatic_nickname
    @nickname = self.last_name[0, 1]
  end

end
