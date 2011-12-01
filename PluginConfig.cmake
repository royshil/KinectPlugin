#/**********************************************************\ 
#
# Auto-Generated Plugin Configuration file
# for tutorial plugin
#
#\**********************************************************/

set(PLUGIN_NAME "tutorialplugin")
set(PLUGIN_PREFIX "TPL")
set(COMPANY_NAME "somecompany")

# ActiveX constants:
set(FBTYPELIB_NAME tutorialpluginLib)
set(FBTYPELIB_DESC "tutorialplugin 1.0 Type Library")
set(IFBControl_DESC "tutorialplugin Control Interface")
set(FBControl_DESC "tutorialplugin Control Class")
set(IFBComJavascriptObject_DESC "tutorialplugin IComJavascriptObject Interface")
set(FBComJavascriptObject_DESC "tutorialplugin ComJavascriptObject Class")
set(IFBComEventSource_DESC "tutorialplugin IFBComEventSource Interface")
set(AXVERSION_NUM "1")

# NOTE: THESE GUIDS *MUST* BE UNIQUE TO YOUR PLUGIN/ACTIVEX CONTROL!  YES, ALL OF THEM!
set(FBTYPELIB_GUID 4646191d-6bc3-51cb-97b0-06fa632b56fa)
set(IFBControl_GUID f8af277d-61a2-5f2a-8c68-83946a07670e)
set(FBControl_GUID ef0d769e-d1b0-54b8-9992-ffe9cb26600d)
set(IFBComJavascriptObject_GUID cb6d19ac-7722-54ba-ad40-b8b8bc43a97f)
set(FBComJavascriptObject_GUID 9b371295-4b8f-5bb8-86df-341b88315bda)
set(IFBComEventSource_GUID b07de59b-bebc-5fcd-aaab-229b48e53f42)

# these are the pieces that are relevant to using it from Javascript
set(ACTIVEX_PROGID "somecompany.tutorialplugin")
set(MOZILLA_PLUGINID "somecompany.com/tutorialplugin")

# strings
set(FBSTRING_CompanyName "some company")
set(FBSTRING_FileDescription "tutorial plugin")
set(FBSTRING_PLUGIN_VERSION "1.0.0.0")
set(FBSTRING_LegalCopyright "Copyright 2011 some company")
set(FBSTRING_PluginFileName "np${PLUGIN_NAME}.dll")
set(FBSTRING_ProductName "tutorial plugin")
set(FBSTRING_FileExtents "")
set(FBSTRING_PluginName "tutorial plugin")
set(FBSTRING_MIMEType "application/x-tutorialplugin")

# Uncomment this next line if you're not planning on your plugin doing
# any drawing:

#set (FB_GUI_DISABLED 1)

# Mac plugin settings. If your plugin does not draw, set these all to 0
set(FBMAC_USE_QUICKDRAW 0)
set(FBMAC_USE_CARBON 0)
set(FBMAC_USE_COCOA 1)
set(FBMAC_USE_COREGRAPHICS 0)
set(FBMAC_USE_COREANIMATION 1)
set(FBMAC_USE_INVALIDATINGCOREANIMATION 1)

# If you want to register per-machine on Windows, uncomment this line
#set (FB_ATLREG_MACHINEWIDE 1)
