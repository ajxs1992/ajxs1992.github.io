#include <amxmodx>
#include <amxmisc>

#define PLUGIN  "Welcome MOTD"
#define VERSION "1.0.0"
#define AUTHOR  "AJXS"

new const MOTD_FILE[] = "welcome_motd.txt"

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR)
    register_cvar("amx_welcome_motd", "1")
}

public client_putinserver(id)
{
    if (!is_user_connected(id) || is_user_bot(id) || is_user_hltv(id))
        return

    if (!get_cvar_num("amx_welcome_motd"))
        return

    set_task(1.5, "show_welcome", id)
}

public show_welcome(id)
{
    if (!is_user_connected(id))
        return

    new path[96]
    get_configsdir(path, charsmax(path))
    format(path, charsmax(path), "%s/%s", path, MOTD_FILE)

    if (file_exists(path))
        show_motd(id, path, "Welcome")
    else
        show_motd(id, "Welcome to the server.^nEdit addons/amxmodx/configs/welcome_motd.txt", "Welcome")
}
