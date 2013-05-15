require 'spec_helper'

describe Aristocrat do

  # let(:aristocrat) {Aristocrat.create(:first_name => "Leopold", :surname => "Das-GrosseSchnitzer", :email => "L.Das-GrosseSchnitzer@curryworst.com")}

  context 'validates first name exist' do
    it { should validate_presence_of :first_name }
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
end