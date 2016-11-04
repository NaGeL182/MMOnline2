# Well here we go

# => Things here should generally

#requiring rubygems throws an error no clue why?
#same with ashton and gamebox, see gemfile
require 'rubygems'
require 'gosu'
#require 'texplay'
#require 'ashton'

#Begin External library file Requires
require_relative "lib/globalVars.rb"
require_relative "lib/debugIO.rb"

#Begin External script file Requires


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
    $winWidth = CONST_winWidth
    $winHeight = CONST_winHeight
    super $winWidth, $winHeight
    DEBUG.cout("Window Size set to #{$winWidth}x#{$winHeight}px", 0, false)

    #Window Title
    self.caption = "MMOnline 2  v." + CONST_PRODUCTVERSION
    DEBUG.cout("Set window title using version #{CONST_PRODUCTVERSION}", 0, true)

    #Begin loading images into memory. This is going to be REALLY LONG!
    # => @loadstatus variable is, as an integer, a descriptor of how many images have been loaded.
    imgNum = 0

    # Loads image from the constant array using the @imgNum variable as an adress into the array.
    # => Dynamically creates a new variable for each item in the arrayS
    # => Does this in a loop, file path is represented by variable \f\
    # => Will replace '/' and '.' with '_'
    # => Final Naming should be <assets folder>_<assets subfolder>_<filename>_<extension without the dot>
    CONST_LOADINGFILES.length.times do |f|
        # => Next two lines replace bad chars in the string with underscores.
        assetName = CONST_LOADINGFILES[imgNum].tr('/', '_')
        assetName = assetName.tr('.', '_')
        # => Creates a brand new instance variable with naming convention shown above.
        # => Initializes it in gosu.
        instance_variable_set("@#{assetName}", Gosu::Image.new(CONST_LOADINGFILES[imgNum], :tileable => true))
        DEBUG.cout("Initialized image file '#{CONST_LOADINGFILES[imgNum]}' with assetName '@#{assetName}'", 0, false)
        imgNum += 1
    end
  end

  def update
      #For dem frame per second updates
  end


  def draw
      #Will redraw the entire screen. For menu changes and such
      @assets_bg_startupBG1_jpg.draw(0,0,0, factor_x=1.2, factor_y=1.2)
      DEBUG.cout("Drew image #{@assets_bg_startupBG1_jpg} : @assets_bg_startupBG1_jpg.", 0, true)
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
