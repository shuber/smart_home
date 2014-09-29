# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

reading_start = 5.days.ago
reading_interval = 5.minutes
reading_range = 70.0..80.0

sensor_name = "TEMP1"
sensor_values = { name: sensor_name, type: Sensor::TYPES.first }
sensor = Sensor.where(sensor_values).first || Sensor.create!(sensor_values)

if sensor.persisted?
  puts "Seeding #{sensor.type} sensor ##{sensor.id} - #{sensor.name}"
else
  raise "Seed attributes for #{sensor.class} are invalid"
end

while reading_start < Time.now
  reading_start = reading_start + reading_interval
  value = rand(reading_range).round 2
  reading = sensor.readings.create! value: value, created_at: reading_start

  puts "Reading #{reading.created_at} - #{reading.value}"
end
