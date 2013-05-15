require 'spec_helper'

describe Aristocrat do

  let(:aristocrat) {Aristocrat.create(:first_name => "Leopold", :last_name => "Das-GrosseSchnitzer", :email => "L.Das-GrosseSchnitzer@curryworst.com")}

  it "has a first name" do
    aristocrat.first_name.should eq "Leopold"
  end

  it 'validates first name exist' do
    aristocrat.should validate_presence_of :first_name
  end

  it 'has a last name' do
    aristocrat.last_name.should eq "Das-GrosseSchnitzer"
  end

  it 'validates last name with minimum 10 character' do
    aristocrat.should ensure_length_of(:last_name).is_at_least(10).with_message("You are not one of us")
  end

  it 'validates last name only with a hyphen' do
    aristocrat.should allow_value("Das-GrosseSchnitzer").for(:last_name)
  end

  it 'does not validate last name without an hyphen' do
    aristocrat.should_not allow_value("GrosseSchnitzer").for(:last_name)
  end

  it 'validates email is in the right format' do
    aristocrat.should allow_value("L.Das-GrosseSchnitzer@curryworst.com").for(:email)
  end

  it 'does not validate wrong email format' do
    aristocrat.should_not allow_value("google.com").for(:email)
  end
end