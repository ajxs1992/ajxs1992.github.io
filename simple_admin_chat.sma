#include <amxmodx>
#include <amxmisc>

#define PLUGIN  "Simple Admin Chat"
#define VERSION "1.0.0"
#define AUTHOR  "AJXS"

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR)
    register_clcmd("say /a", "cmd_admin_chat", ADMIN_CHAT, "<message>")
    register_clcmd("say_team /a", "cmd_admin_chat", ADMIN_CHAT, "<message>")
}

public cmd_admin_chat(id, level, cid)
{
    if (!cmd_access(id, level, cid, 2))
        return PLUGIN_HANDLED

    new args[192]
    read_args(args, charsmax(args))
    remove_quotes(args)
    trim(args)

    if (args[0] == EOS)
    {
        client_print(id, print_chat, "[AdminChat] Usage: /a your message")
        return PLUGIN_HANDLED
    }

    new name[32]
    get_user_name(id, name, charsmax(name))

    new players[32], count, i
    get_players(players, count, "ch")
    for (i = 0; i < count; i++)
    {
        if (get_user_flags(players[i]) & ADMIN_CHAT)
            client_print(players[i], print_chat, "[AdminChat] %s: %s", name, args)
    }
    return PLUGIN_HANDLED
}
