require 'rubygems'
require 'curb'
require 'crack'
gem 'activesupport'
require 'active_support'
require 'active_support/version'
# need to pull in the pieces we want with Rails 3
require 'active_support/core_ext' if ActiveSupport::VERSION::MAJOR == 3

module Milo
  class Error < StandardError; end
  class CouldNotAuthenticateYou < StandardError; end
end

require 'milo/product'
require 'milo/main'

