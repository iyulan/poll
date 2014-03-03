require 'spec_helper'

describe Answer do
  it 'is valid' do
    expect(build(:answer)).to be_valid
  end
end
