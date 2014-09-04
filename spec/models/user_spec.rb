require 'spec_helper'

describe User do
  subject { User.new(first_name: 'Bob', last_name: 'Smith')}
  it 'full_name should be first and last name' do
    subject.full_name.should eql 'Bob Smith'
  end

  it 'should be able to add tags' do
    subject.tag_list.add('New Tag')
    subject.tag_list.should include 'New Tag'
  end

  it 'should be able to remove tags' do
    subject.tag_list.add('This Tag')
    subject.tag_list.remove('This Tag')
    subject.tag_list.should_not include 'This Tag'
  end
end
