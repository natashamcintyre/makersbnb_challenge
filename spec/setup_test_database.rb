require 'active_record'

def setup_test_database
  p 'Setting up test databases...'

  ActiveRecord::Base.connection.execute("TRUNCATE spaces, bookings, users;")

end
