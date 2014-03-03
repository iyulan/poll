require 'spec_helper'

describe Question do
  it 'is valid' do
    expect(build(:question)).to be_valid
  end

  it 'is include many answers' do
    expect(build(:question, many_answers: true)).to be_include_many_answers
  end
end
