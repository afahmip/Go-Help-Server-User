class User < ApplicationRecord
  validates_presence_of :name, :email, :password, :device_id
end
