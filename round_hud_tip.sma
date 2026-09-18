#include <amxmodx>

#define PLUGIN  "Round HUD Tip"
#define VERSION "1.0.0"
#define AUTHOR  "AJXS"

new g_enabled

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR)
    g_enabled = register_cvar("amx_round_tip", "1")
    register_event("HLTV", "on_round", "a", "1=0", "2=0")
}

public on_round()
{
    if (!get_pcvar_num(g_enabled))
        return

    set_hudmessage(0, 255, 180, -1.0, 0.20, 0, 0.0, 4.0, 0.1, 0.2, -1)
    show_hudmessage(0, "Play fair. Type /rules if you are new.")
}
