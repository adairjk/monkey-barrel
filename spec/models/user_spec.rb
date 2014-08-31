require 'spec_helper'

describe User do
  subject { User.new(first_name: 'Bob', last_name: 'Smith')}
  it 'full_name should be first and last name' do
    subject.full_name.should eql 'Bob Smith'
  end
end
