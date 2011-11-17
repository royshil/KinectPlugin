/**********************************************************\

  Auto-generated tutorialpluginAPI.cpp

\**********************************************************/

#include "JSObject.h"
#include "variant_list.h"
#include "DOM/Document.h"
#include "global/config.h"

#include "tutorialpluginAPI.h"

///////////////////////////////////////////////////////////////////////////////
/// @fn tutorialpluginAPI::tutorialpluginAPI(const tutorialpluginPtr& plugin, const FB::BrowserHostPtr host)
///
/// @brief  Constructor for your JSAPI object.  You should register your methods, properties, and events
///         that should be accessible to Javascript from here.
///
/// @see FB::JSAPIAuto::registerMethod
/// @see FB::JSAPIAuto::registerProperty
/// @see FB::JSAPIAuto::registerEvent
///////////////////////////////////////////////////////////////////////////////
tutorialpluginAPI::tutorialpluginAPI(const tutorialpluginPtr& plugin, const FB::BrowserHostPtr& host) : m_plugin(plugin), m_host(host)
{
    registerMethod("echo",      make_method(this, &tutorialpluginAPI::echo));
    registerMethod("testEvent", make_method(this, &tutorialpluginAPI::testEvent));

    // Read-write property
    registerProperty("testString",
                     make_property(this,
                        &tutorialpluginAPI::get_testString,
                        &tutorialpluginAPI::set_testString));

    // Read-only property
    registerProperty("version",
                     make_property(this,
                        &tutorialpluginAPI::get_version));
}

///////////////////////////////////////////////////////////////////////////////
/// @fn tutorialpluginAPI::~tutorialpluginAPI()
///
/// @brief  Destructor.  Remember that this object will not be released until
///         the browser is done with it; this will almost definitely be after
///         the plugin is released.
///////////////////////////////////////////////////////////////////////////////
tutorialpluginAPI::~tutorialpluginAPI()
{
}

///////////////////////////////////////////////////////////////////////////////
/// @fn tutorialpluginPtr tutorialpluginAPI::getPlugin()
///
/// @brief  Gets a reference to the plugin that was passed in when the object
///         was created.  If the plugin has already been released then this
///         will throw a FB::script_error that will be translated into a
///         javascript exception in the page.
///////////////////////////////////////////////////////////////////////////////
tutorialpluginPtr tutorialpluginAPI::getPlugin()
{
    tutorialpluginPtr plugin(m_plugin.lock());
    if (!plugin) {
        throw FB::script_error("The plugin is invalid");
    }
    return plugin;
}



// Read/Write property testString
std::string tutorialpluginAPI::get_testString()
{
    return m_testString;
}
void tutorialpluginAPI::set_testString(const std::string& val)
{
    m_testString = val;
}

// Read-only property version
std::string tutorialpluginAPI::get_version()
{
    return FBSTRING_PLUGIN_VERSION;
}

// Method echo
FB::variant tutorialpluginAPI::echo(const FB::variant& msg)
{
    static int n(0);
    fire_echo(msg, n++);
    return msg;
}

void tutorialpluginAPI::testEvent(const FB::variant& var)
{
    fire_fired(var, true, 1);
}

