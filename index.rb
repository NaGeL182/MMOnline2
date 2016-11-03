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



class GameWindow < Gosu::Window
  def initialize
    #Window Width, Height
    super 1191, 670

    #Window Title
    self.caption = "MMOnline 2  v." + PRODUCTVERSION

    #TEMPORARY
    @loading_img = STARTUP_BG
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
def Main
    puts "HELLO DMM!"
end

Main()



window = GameWindow.new
window.show
