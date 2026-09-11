#ifndef BUTTON_FSM_H
#define BUTTON_FSM_H

#include <stdbool.h>
#include <stdint.h>

typedef enum {
    BUTTON_STATE_OFF,
    BUTTON_STATE_ON,
    BUTTON_STATE_PROTECTED
} ButtonState_t;

typedef struct {
    ButtonState_t current_state;
    uint32_t press_start_time_ms;
    uint32_t press_duration_ms;
    uint32_t protected_start_time_ms;
} ButtonFSM_t;

typedef struct {
    bool debounced_state;
    bool last_raw_state;
    uint32_t last_change_time_ms;
} DebounceFilter_t;

/**
 * @brief Initializes the button state machine context.
 * @param fsm Pointer to the state machine context.
 */
void button_fsm_init(ButtonFSM_t *fsm);

/**
 * @brief Processes one button state-machine cycle.
 * @param fsm Pointer to the state machine context.
 * @param current_time_ms Current system time in milliseconds.
 * @param button_pressed Debounced button state.
 */
void button_fsm_update(ButtonFSM_t *fsm,
                       uint32_t current_time_ms,
                       bool button_pressed);

/**
 * @brief Initializes the debounce filter context.
 * @param filter Pointer to the debounce filter context.
 * @param initial_raw_state Initial raw button reading.
 */
void debounce_init(DebounceFilter_t *filter, bool initial_raw_state);

/**
 * @brief Updates the debounce filter with a new raw reading.
 * @param filter Pointer to the debounce filter context.
 * @param raw_state Current raw button reading.
 * @param current_time_ms Current system time in milliseconds.
 * @return Debounced button state.
 */
bool debounce_update(DebounceFilter_t *filter,
                     bool raw_state,
                     uint32_t current_time_ms);

#endif
