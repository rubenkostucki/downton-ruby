class Servant <ActiveRecord::Base

  belongs_to :aristocrat

  attr_accessible :last_name, :age, :occupation

  validates_presence_of :last_name

  validates :age, :inclusion => 16..100, :presence => true

  validates :occupation, :inclusion => ["Butler", "Maid", "Cook"]

  validates :nickname, :length => { :maximum => 6 }

  before_create :automatic_nickname

  private
    def automatic_nickname
      self.nickname = self.last_name[0, 1]
    end
end
