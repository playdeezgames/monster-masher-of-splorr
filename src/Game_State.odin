package metaphor

import "core:strings"
import "core:fmt"

Game_State :: struct {
    messages: [dynamic]string,
    play_counter: int
}

game_state : Game_State

game_state_init :: proc(game_state: ^Game_State) {
    game_state.messages = make([dynamic]string)
    game_state.play_counter = 0
}

game_state_destroy :: proc(game_state: ^Game_State) {
    game_state_clear_messages(game_state)
    delete(game_state.messages)
}

game_state_keep_playing :: proc (game_state: ^Game_State) {
    game_state_add_message(game_state, "You decide to keep playing!")
    game_state.play_counter += 1
    game_state_add_message(game_state, fmt.tprintf("You have done this %d times.", game_state.play_counter))
}

game_state_can_keep_playing :: proc (game_state: ^Game_State) -> bool {
    return true
}

game_state_add_message :: proc(game_state: ^Game_State, message: string) {
    append(&game_state.messages, strings.clone(message, game_state.messages.allocator))
}

game_state_clear_messages :: proc(game_state: ^Game_State) {
    for s in game_state.messages {
        delete(s, game_state.messages.allocator)
    }
    clear(&game_state.messages)
}

