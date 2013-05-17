require 'spec_helper'

describe Club do
  it { should have_and_belong_to_many(:aristocrat)}
end