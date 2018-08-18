class UserRequest < ApplicationRecord
  belongs_to :user

  validates_presence_of :helper_type_id, :longitude, :latitude, :device_id
end
