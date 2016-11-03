
#Here you put all variables you want to be returned to the index file or others.
#This is to be used mainly for things like application version, and other static things like that.

#Remember all constants begin with a capital letter.
#Please make all constants in this file all caps.

#Begin constants


#Game Versions are written as so: <Major Release Number> . <Minor Release Number> . <Bugfix or Pre-Beta Update Number>
# ================ GENERAL ================
PRODUCTVERSION = '0.0.1'


# ================ Gosu Images ================

STARTUP_BG = Gosu::Image.new("assets/bg/miiaBG1.jpg", :tileable => true)
