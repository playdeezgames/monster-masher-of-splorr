package metaphor

KEEP_PLAYING_COMMAND :: "KEEP_PLAYING_COMMAND"

Command :: struct {
    handler : proc(^Game_State),
    condition : proc(^Game_State) -> bool,
    title: string,
    command: string
}

COMMANDS : []Command : {
    {
        handler = game_state_keep_playing,
        condition = game_state_can_keep_playing,
        title = "Keep Playing!",
        command = KEEP_PLAYING_COMMAND
    }
}

command_dispatch :: proc(name: string) {
    for command in COMMANDS {
        if command.command == name {
            command.handler(&game_state)
        }
    }
}
