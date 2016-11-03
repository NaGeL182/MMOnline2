# Well here we go


#Including all

#requiring rubygems throws an error no clue why?
#same with ashton, see gemfile
require 'rubygems'
require 'gosu'
#require 'texplay'
#require 'ashton'
#require 'gamebox'

#Begin External File Requires
require_relative "lib/globalVars.rb"
require_relative "lib/debugIO.rb"


def preInit
    #Pre-Startup things go here. THIS RUNS BEFORE ANY SCREEN DRAWING OR ANYTHING!!!

    # Start in Verbose Debug mode
    # Change to false for no verbose but still debug
    # Comment out for no console output.
    DEBUG.new(true)
    DEBUG.cout("Debugging has been loaded, initial cout here.", 0, false)
end


class GameWindow < Gosu::Window
  def initialize
    #Window Width, Height
    super 1191, 670

    #Window Title
    self.caption = "MMOnline 2  v." + CONST_PRODUCTVERSION

    #TEMPORARY
    @loading_img = CONST_STARTUP_BG
    #TEMPORARY
  end

  def update
      #For dem frame per second updates
  end


  def draw
      #Will redraw the entire screen. For menu changes and such
      @loading_img.draw(0,0,0)
  end
end


#Main class is to provide a gateway for console I/O
#Generally should not be edited
def Main
    preInit()
    return nil
end

Main()



window = GameWindow.new
window.show
