class Reading < ActiveRecord::Base
  belongs_to :sensor, touch: true

  validates_presence_of :sensor_id, :value
end
