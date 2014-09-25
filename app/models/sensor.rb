class Sensor < ActiveRecord::Base
  TYPES = ["Temperature"]

  self.inheritance_column = "ignore"

  has_many :readings

  validates_inclusion_of :type, in: TYPES
  validates_presence_of :name, :type
  validates_uniqueness_of :name, scope: :type, case_sensitive: false
end
