require 'rails_helper'

RSpec.describe UserRequest, type: :model do
  it { should validate_presence_of(:helper_type_id) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:device_id) }
end
