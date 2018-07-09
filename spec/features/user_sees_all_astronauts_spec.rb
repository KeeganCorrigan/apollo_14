require 'rails_helper'

describe "a user visits astronauts" do

  it "sees a list of all astronauts" do
    astronaut_1 = Astronaut.create!(name: "asd", age: 12, job:"ouahsd")
    astronaut_2 = Astronaut.create!(name: "asdfsa", age: 20, job:"iu139h")

    visit astronauts_path

    expect(page).to have_content("Name: #{astronaut_1.name}")
    expect(page).to have_content("Age: #{astronaut_1.age}")
    expect(page).to have_content("Job: #{astronaut_1.job}")
    expect(page).to have_content("Name: #{astronaut_2.name}")
    expect(page).to have_content("Age: #{astronaut_2.age}")
    expect(page).to have_content("Job: #{astronaut_2.job}")
  end

  it "sees the average age of all astonauts" do
    astronaut_1 = Astronaut.create!(name: "asd", age: 10, job:"ouahsd")
    astronaut_2 = Astronaut.create!(name: "asdfsa", age: 20, job:"iu139h")
    astronaut_3 = Astronaut.create!(name: "98234hud", age: 30, job:"ansd")

    visit astronauts_path

    expected = 20

    expect(page).to have_content("Average age: #{expected}")
  end

  it "sees the space missions in alphabetical order for all astronauts" do
    astronaut_1 = Astronaut.create!(name: "asd", age: 10, job:"ouahsd")
    astronaut_2 = Astronaut.create!(name: "asdfsa", age: 20, job:"iu139h")
    astronaut_3 = Astronaut.create!(name: "98234hud", age: 30, job:"ansd")
    space_mission_1 = SpaceMission.create!(title: "aaaaaaa", trip_length: 20)
    space_mission_2 = SpaceMission.create!(title: "zzzzzzzz", trip_length: 50)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_1.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_2.id, space_mission_id: space_mission_2.id)

    visit astronauts_path

    expect(page).to have_content(space_mission_1.title)
    expect(page).to have_content(space_mission_2.title)
  end
  it "sees time in space for an astronaut" do
    astronaut_1 = Astronaut.create!(name: "asd", age: 10, job:"ouahsd")
    space_mission_1 = SpaceMission.create!(title: "aaaaaaa", trip_length: 20)
    space_mission_2 = SpaceMission.create!(title: "zzzzzzzz", trip_length: 50)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_1.id)

    expected = astronaut_1.space_time

    visit astronauts_path

    expect(page).to have_content("time in space: #{expected}")
  end
end
