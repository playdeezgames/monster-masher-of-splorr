package metaphor

import "core:fmt"

update :: proc() {
    js_clear()
    for message in game_state.messages {
        js_write(fmt.tprintf("%s\n", message))
    }
    game_state_clear_messages(&game_state)
    js_write("Yer playing the game!\n")
    for command in COMMANDS {
        if command.condition(&game_state) {
            js_add_button(command.title, command.command)
        }
    }
}
