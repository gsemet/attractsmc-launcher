"""
    Plugin for Launching programs
"""

# -*- coding: UTF-8 -*-
# main imports
import sys
import os
import xbmc
import xbmcgui
import xbmcaddon

# plugin constants
__plugin__ = "attracsmc-launcher"
__author__ = "jcnventura/gsemet"
__url__ = "http://blog.petrockblock.com/retropie/"
__git_url__ = "https://github.com/gsemet/attracsmc/"
__credits__ = "gsemet"
__version__ = "0.0.1"

dialog = xbmcgui.Dialog()
addon = xbmcaddon.Addon(id='plugin.program.attracsmc-launcher')

output=os.popen("/home/osmc/RetroPie/scripts/attracsmc.sh").read()
#dialog.ok("Starting RetroPie",output)
#print output
