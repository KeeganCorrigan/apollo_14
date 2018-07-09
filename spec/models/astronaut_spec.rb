require 'rails_helper'

describe Astronaut, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:job) }
  end

  describe "relationship" do
    xit { should have_many(:space_missions) }
  end

  describe "class methods" do
    describe ".average_age" do
      it "should return average age of all astronauts" do
        astronaut_1 = Astronaut.create!(name: "asd", age: 10, job:"ouahsd")
        astronaut_2 = Astronaut.create!(name: "asdfsa", age: 20, job:"iu139h")
        astronaut_2 = Astronaut.create!(name: "asdfsa", age: 30, job:"iu139h")

        expected = 20

        expect(Astronaut.average_age).to eq(expected)
      end
    end
  end

  describe "instance methods" do
    describe ".space_time" do
      it "should return total time spent in space" do
        astronaut_1 = Astronaut.create!(name: "asd", age: 10, job:"ouahsd")
        space_mission_1 = SpaceMission.create!(title: "aaaaaaa", trip_length: 20)
        space_mission_2 = SpaceMission.create!(title: "zzzzzzzz", trip_length: 50)
        AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)
        AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_1.id)

        expected = 70

        expect(astronaut_1.space_time).to eq(expected)
      end
    end
  end
end
