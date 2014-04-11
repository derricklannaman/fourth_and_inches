class ProgramController < ApplicationController

  def new
    @program = Program.new
  end
end
