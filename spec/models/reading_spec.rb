require 'rails_helper'

RSpec.describe Reading do
  subject { build :reading }

  it { should belong_to(:sensor).touch }

  it { should validate_presence_of :sensor_id }
  it { should validate_presence_of :value }
end
