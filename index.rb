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

    # => Preload loading bar to show other image loading data outside of console.
    @assets_bg_startupBG1_jpg = Gosu::Image.new("assets/bg/startupBG1.jpg", :tileable => true)
    DEBUG.cout("Initialized image file 'startupBG1' during Pre-Initialization with assetName 'startupBG1'", 0, false)
    @assets_misc_loadingbar_png = Gosu::Image::load_tiles("assets/misc/loadingbar.png", 128, 16, {:retro => true})
    DEBUG.cout("Initialized image file 'loadingbar' during Pre-Initialization with assetName 'loadingbar'", 0, false)

    #Begin loading images into memory. This is going to be REALLY LONG!
    # => @loadstatus variable is, as an integer, a descriptor of how many assets have been loaded.
    @loadingstatus = 0

    # Loads static images from the constant array using the @imgNum variable as an adress into the array.
    # => Dynamically creates a new variable for each item in the arrayS
    # => Does this in a loop, file path is represented by variable \f\
    # => Will replace '/' and '.' with '_'
    # => Final Naming should be <assets folder>_<assets subfolder>_<filename>_<extension without the dot>

    # => Initialize the background first, so the loading bar can render properly.
    #Begin Pre-Init resource loading block.
    CONST_LOADINGFILES.length.times do |f|
        # => Next two lines replace bad chars in the string with underscores.
        assetName = CONST_LOADINGFILES[@loadingstatus].tr('/', '_')
        assetName = assetName.tr('.', '_')
        # => Creates a brand new instance variable with naming convention shown above.
        # => Initializes it in gosu.
        instance_variable_set("@#{assetName}", Gosu::Image.new(CONST_LOADINGFILES[@loadingstatus], :tileable => true))
        DEBUG.cout("Initialized image file '#{CONST_LOADINGFILES[@loadingstatus]}' with assetName '#{assetName}'", 0, false)
        @loadingstatus += 1
    end
    #End Pre-Init resource loading block.
  end

  def update
      #For key detection and stuff
  end


  def draw
      #Will redraw the entire screen. For graphics changes and such

      #draw background image and scale by a factor of 1.25
      @assets_bg_startupBG1_jpg.draw(0,0,0, factor_x=1.25, factor_y=1.25)
      DEBUG.cout("Drew image #{@assets_bg_startupBG1_jpg} : assets_bg_startupBG1_jpg.", 0, true)

      #Draw custom mouse cursor for game.
      @assets_misc_cursor_png.draw self.mouse_x, self.mouse_y, 666
      DEBUG.cout("Drew image #{@assets_misc_cursor_png} : assets_misc_cursor_png.", 0, true)

      @assets_misc_loadingbar_png[@loadingstatus].draw(403, 345, 1, scale_x = 3, scale_y = 3)
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
