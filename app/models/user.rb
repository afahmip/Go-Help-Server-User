class User < ApplicationRecord
  has_many :user_requests, dependent: :destroy

  validates_presence_of :name, :email, :password, :device_id
end
