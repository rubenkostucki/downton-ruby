require 'spec_helper'

describe Aristocrat do

  it { should have_and_belong_to_many(:club)}
  it { should have_many(:servants)}

  context 'validates first name exist' do
    it { should validate_presence_of(:first_name) }
  end

  context 'validates surname with minimum 10 character' do
    it { should ensure_length_of(:surname).is_at_least(10).with_message("You are not one of us") }
  end

  context 'validates surname only with a hyphen' do
    it {  should allow_value("Das-GrosseSchnitzer").for(:surname) }
  end

  context 'does not validate surname without an hyphen' do
    it { should_not allow_value("GrosseSchnitzer").for(:surname) }
  end

  context 'validates email is in the right format' do
    it { should allow_value("L.Das-GrosseSchnitzer@curryworst.com").for(:email) }
  end

  context 'does not validate wrong email format' do
    it { should_not allow_value("google.com").for(:email) }
  end

  context 'can get all servants over a certain age' do
    pedro = Servant.create(:last_name => "Pedro", :age => 26, :occupation =>"Butler")
    yokoko = Servant.create(:last_name => "Yokoko", :age => 27, :occupation =>"Maid")

    aristocrat = Aristocrat.create do |x|
      x.first_name = "Bruno"
      x.surname = "Das-GrosseSchnitzer"
      x.email = "B.Das-GrosseSchnitzer@curryworst.com"
    end

    aristocrat.

    it { aristocratshould}
  end
end