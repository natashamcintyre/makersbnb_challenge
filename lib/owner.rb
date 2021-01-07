require 'active_record'

class Owner < ActiveRecord::Base
  has_many :spaces
end