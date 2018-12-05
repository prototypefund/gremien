require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  
  def login_as( account )
    post login_url, params: { email: account.email,
          password: 'secret' }
  end
  
  def logout
    delete logout_url
  end
  
  def setup
    login_as accounts( :one )
  end
  
end
