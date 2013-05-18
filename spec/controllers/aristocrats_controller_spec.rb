require 'spec_helper'

describe AristocratsController do

  let(:aristocrat_input) { {:aristocrat => { :first_name => "Bruno", :surname => "Das-GrosseSchnitzer", :email => "L.Das-GrosseSchnitzer@curryworst.com"}}}

  let(:non_artistocrat_input) {{:aristocrat => { :surname => "WithoutaHyphen" }}}

  context 'with valid aristocrat_input' do
    it 'creates a new aristocrat' do
      expect { post :create, aristocrat_input }.to change(Aristocrat, :count).by(1)
    end

    it 'returns JSON when creating an aristocrat' do
      post :create, aristocrat_input
      response.body.should eq '{"aristocrat is born"}'
    end
  end

  context 'with invalid aristocrat_input' do
    it 'does not create a new aristocrat' do
      post :create, non_artistocrat_input
      assigns(:aristocrat).should_not be_persisted
    end

    it 'returns an JSON error' do
      post :create, non_artistocrat_input
      response.body.should eq '{"invalid aristocrat input data"}'
    end
  end
end
