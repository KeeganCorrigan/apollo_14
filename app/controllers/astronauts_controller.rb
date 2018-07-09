class AstronautsController < ApplicationController

  def index
    @astronauts_average_age = Astronaut.average_age
    @astronauts = Astronaut.all
  end

end
