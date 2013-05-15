require 'spec_helper'

describe Servant do

  context 'has a last name'
    it { should validate_presence_of(:last_name)}

  context 'has an age bigger than 16'
    it { should ensure_inclusion_of(:age).in_range(16..100) }

  context 'occupation is Butler, Maid or Cook'
    it { should allow_value("Butler").for(:occupation)}
    it { should_not allow_value("Barber").for(:occupation)}
    it { should ensure_inclusion_of(:occupation).in_array(["Butler", "Maid", "Cook"])}

  context 'can be given a nickname 6 characters long minimum'
    it { should allow_value("elconqistador").for(:nickname) }
    it { should_not allow_value("woppy").for(:nickname) }

  context 'assigns automatic nickname before create'
    servant = Servant.new(:last_name => "Pedro", :age => 10, :occupation =>"Butler")
    servant.save
    it { servant.automatic_nickname.should eq "P"}
end