require 'spec_helper'

describe Servant do

  it { should belong_to(:aristocrat) }

  it { should have_db_index(:aristocrat_id)}

  context 'has a last name' do
    it { should validate_presence_of(:last_name)}
  end

  context 'has an age bigger than 16' do
    it { should ensure_inclusion_of(:age).in_range(16..100) }
  end

  context 'occupation is Butler, Maid or Cook' do
    it { should allow_value("Butler").for(:occupation)}
    it { should_not allow_value("Barber").for(:occupation)}
    it { should ensure_inclusion_of(:occupation).in_array(["Butler", "Maid", "Cook"])}
  end

  context 'can be given a nickname 6 characters long minimum' do
    it { should_not allow_value("elconqistador").for(:nickname) }
    it { should allow_value("woppy").for(:nickname) }
  end

  context 'assigns automatic nickname before create' do
    servant = Servant.create(:last_name => "Pedro", :age => 17, :occupation =>"Butler")
    it { servant.nickname.should eq "P"}
  end
end