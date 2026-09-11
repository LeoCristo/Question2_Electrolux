#include "button_fsm.h"

#include "app_log.h"
#include "board_config.h"
#include "em_gpio.h"

#define PROTECTED_TIMEOUT_MS  10000U
#define DEBOUNCE_DELAY_MS     50U

/**
 * @brief Controls the LED according to its active-low logic.
 * @param state LED state: LED_ON to turn it on, or LED_OFF to turn it off.
 */
static void set_led_state(uint8_t state)
{
    if (state == LED_ON) {
        GPIO_PinOutClear(LED_PORT, LED_PIN);
    } else {
        GPIO_PinOutSet(LED_PORT, LED_PIN);
    }
}

/**
 * @brief Initializes all fields of the button state machine.
 * @param fsm Pointer to the state machine context to initialize.
 */
void button_fsm_init(ButtonFSM_t *fsm)
{
    if (fsm == NULL) {
        return;
/**
 * @brief Initializes the debounce filter with the current button reading.
 * @param filter Pointer to the debounce filter context to initialize.
 * @param initial_raw_state Initial instantaneous button state.
 */
    }

    fsm->current_state = BUTTON_STATE_OFF;
    fsm->press_start_time_ms = 0U;
/**
 * @brief Updates the debounce filter using a non-blocking time comparison.
 * @param filter Pointer to the debounce filter context.
 * @param raw_state Current instantaneous button reading.
 * @param current_time_ms Current system time in milliseconds.
 * @return The filtered button state after debounce processing.
 */
    fsm->press_duration_ms = 0U;
    fsm->protected_start_time_ms = 0U;
}

void debounce_init(DebounceFilter_t *filter, bool initial_raw_state)
{
    if (filter == NULL) {
        return;
    }

    filter->debounced_state = initial_raw_state;
    filter->last_raw_state = initial_raw_state;
    filter->last_change_time_ms = 0U;
}

bool debounce_update(DebounceFilter_t *filter,
                     bool raw_state,
                     uint32_t current_time_ms)
{
    if (filter == NULL) {
        return false;
    }

    if (raw_state != filter->last_raw_state) {
        filter->last_change_time_ms = current_time_ms;
        filter->last_raw_state = raw_state;
    }

    if ((current_time_ms - filter->last_change_time_ms) >= DEBOUNCE_DELAY_MS) {
        filter->debounced_state = raw_state;
    }

    return filter->debounced_state;
}

/**
 * @brief Processes one state-machine cycle and controls the LED.
 * @param fsm Pointer to the button state machine context.
 * @param current_time_ms Current system time in milliseconds.
 * @param button_pressed Debounced button state, true when pressed.
 */
void button_fsm_update(ButtonFSM_t *fsm,
                       uint32_t current_time_ms,
                       bool button_pressed)
{
    if (fsm == NULL) {
        return;
    }

    switch (fsm->current_state) {
        case BUTTON_STATE_OFF:
            set_led_state(LED_OFF);
            if (button_pressed) {
                fsm->press_start_time_ms = current_time_ms;
                fsm->current_state = BUTTON_STATE_ON;
                set_led_state(LED_ON);
                app_log_info("[%08lu ms] FSM Transition: OFF -> ON" APP_LOG_NL,
                             (unsigned long)current_time_ms);
            }
            break;

        case BUTTON_STATE_ON:
            set_led_state(LED_ON);
            fsm->press_duration_ms = current_time_ms - fsm->press_start_time_ms;

            if (!button_pressed) {
                fsm->protected_start_time_ms = current_time_ms;
                fsm->current_state = BUTTON_STATE_PROTECTED;
                app_log_info("[%08lu ms] FSM Transition: ON -> PROTECTED | Press Duration: %lu ms" APP_LOG_NL,
                             (unsigned long)current_time_ms,
                             (unsigned long)fsm->press_duration_ms);
            }
            break;

        case BUTTON_STATE_PROTECTED:
            set_led_state(LED_ON);

            if ((current_time_ms - fsm->protected_start_time_ms) >= PROTECTED_TIMEOUT_MS) {
                fsm->current_state = BUTTON_STATE_OFF;
                set_led_state(LED_OFF);
                app_log_info("[%08lu ms] FSM Transition: PROTECTED -> OFF (10s Timeout Elapsed)" APP_LOG_NL,
                             (unsigned long)current_time_ms);
            }
            break;

        default:
            fsm->current_state = BUTTON_STATE_OFF;
            set_led_state(LED_OFF);
            app_log_error("Invalid FSM state; resetting to OFF" APP_LOG_NL);
            break;
    }
}
