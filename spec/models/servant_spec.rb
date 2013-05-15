require 'spec_helper'

describe Servants do

  context 'has a last name'
    it { should validate_presence_of(:last_name)}

  context 'has an age bigger than 16'
    it { should ensure_inclusion_of(:age).in_range(16..100) }

  context 'occupation is Butler, Maid or Cook'
    it { should allow_value("Butler").for(:occupation)}
    it { should_not allow_value("Barber").for(:occupation)}
    it { should ensure_inclusion_of(:occupation).in_array(["Butler", "Maid", "Cook"])}

end