$: << File.expand_path("app")
require 'pry'
require 'awesome_print'

def require_number_modules
  require 'active_support/core_ext/date/conversions'
  require 'active_support/core_ext/hash/keys'
  require 'active_support/core_ext/hash/reverse_merge'
  require 'active_support/i18n'
  require 'action_view/helpers/number_helper'
end