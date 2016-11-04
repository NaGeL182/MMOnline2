
#Here you put all CONSTANTS you want to be accessible to the index file or others.
#This is to be used mainly for things like application version, default window size, and other static values.

#Remember all constants begin with a capital letter.


#Begin constants

#Game Versions are written as so: <Major Release Number> . <Minor Release Number> . <Bugfix or Pre-Beta Update Number>
# ================ GENERAL ================
CONST_PRODUCTVERSION = '0.0.1'

# Boolean Value, is verbose debugging enabled (true) or disabled (false) ?
CONST_VERBOSE = false

#Default window dimensions in pixels.
CONST_winWidth = 1191
CONST_winHeight = 670


# ================ Gosu Image Array ================

# => Array containing the path to EACH AND EVERY IMAGE ASSET THAT SHOULD BE REGISTERED INTO MEMORY ON STARTUP/LOAD.
# => UNLESS YOU WANT PROBLEMS: All paths should be "assets/<categorical subfolder>/filename.extnesion"
CONST_LOADINGFILES = ["assets/bg/miiaBG1.jpg", "assets/bg/startupBG1.jpg"]
