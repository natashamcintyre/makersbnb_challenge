require 'active_record'

class Owner < ActiveRecord::Base
  has_many :spaces
  has_secure_password
end