require 'spec_helper'

Rspec.describe "application/index", :type => :view do
    it 'should include with welcome message' do
      render
      expect(rendered).to have_content('Hello Monkeys')
    end
end