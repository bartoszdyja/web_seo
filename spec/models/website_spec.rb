require 'rails_helper'

describe Website do
  it 'has a valid name' do
    Website.create(name: nil).should_not be_valid
  end
end