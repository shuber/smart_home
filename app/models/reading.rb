class Reading < ActiveRecord::Base
  belongs_to :sensor, touch: true

  validates_presence_of :sensor_id, :value

  def self.temperature
    joins(:sensor).where "type = ?", "Temperature"
  end
end
