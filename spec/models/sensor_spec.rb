require 'rails_helper'

RSpec.describe Sensor do
  subject { FactoryGirl.build :sensor }

  it { should allow_value("Temperature").for :type }
  it { should_not allow_value("invalid").for :type }

  it { should validate_presence_of :name }
  it { should validate_presence_of :type }

  it { should validate_uniqueness_of(:name).scoped_to(:type).case_insensitive }
end
