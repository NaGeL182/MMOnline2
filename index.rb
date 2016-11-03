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
    # Pre-Startup things go here. THIS RUNS BEFORE ANY SCREEN DRAWING OR ANYTHING!!!
    # Determines Debug mode
    # Change CONST_VERBOSE in globalVars.rb to switch from verbose to nonverbose.
    DEBUG.new(CONST_VERBOSE)

    #Syntax for console out function is <message> <message severity from 0-4> <should it be displayed only in verbose mode?>
    DEBUG.cout("Debugging has been loaded, initial cout here.", 0, false)

    #Signal end of Preinitialization code
    DEBUG.cout("PreInit Finished!", 0, false)
end


class GameWindow < Gosu::Window
  def initialize
    #Window Width, Height
    @@winWidth = CONST_winWidth
    @@winHeight = CONST_winHeight
    super @@winWidth, @@winHeight
    DEBUG.cout("Window Size set to #{@@winWidth}x#{@@winHeight}px", 0, false)

    #Window Title
    self.caption = "MMOnline 2  v." + CONST_PRODUCTVERSION
    DEBUG.cout("Set window title using version #{CONST_PRODUCTVERSION}", 0, true)

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
    #Begin preinitialization
    preInit()

    #Render Game Window and begin drawing onto the screen.

    DEBUG.cout("Initializing Game Window...", 0, false)
    window = GameWindow.new
    window.show

    #End game and return to desktop
    return nil
end

#Call main function wrapper
Main()
