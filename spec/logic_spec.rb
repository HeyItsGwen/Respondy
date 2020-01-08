# frozen_string_literal: true

require '../bin/RespondyB.rb'
require 'spec_helper.rb'

=begin
RSpec.describe 'replyer' do
  it "should output that it's checking for replies to the console" do
    printed = capture_stdout do
      replyer
    end
    printed.should include?('check for replies since ')
  end
end
=end