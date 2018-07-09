class Astronaut < ApplicationRecord
  has_many :astronaut_space_missions

  has_many :space_missions, through: :astronaut_space_missions

  validates_presence_of :name, :age, :job

  def self.average_age
    average(:age).to_i
  end

  def space_time
    space_missions.sum(:trip_length)
  end
end
