
#Here you put all CONSTANTS you want to be accessible to the index file or others.
#This is to be used mainly for things like application version, default window size, and other static values.

#Remember all constants begin with a capital letter.


#Begin constants

#Game Versions are written as so: <Major Release Number> . <Minor Release Number> . <Bugfix or Pre-Beta Update Number>
# ================ GENERAL ================
CONST_PRODUCTVERSION = '0.0.1'

# Boolean Value, is verbose debugging enabled (true) or disabled (false) ?
CONST_VERBOSE = true

#Default window dimensions in pixels.
CONST_winWidth = 1191
CONST_winHeight = 670


# ================ Gosu Images ================

CONST_STARTUP_BG = Gosu::Image.new("assets/bg/miiaBG1.jpg", :tileable => true)
