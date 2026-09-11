#include <stdbool.h>
#include <stdint.h>

#include "board_config.h"
#include "button_fsm.h"

#include "app_log.h"
#include "em_gpio.h"
#include "em_cmu.h"
#include "sl_event_handler.h"
#include "sl_sleeptimer.h"

static ButtonFSM_t fsm;
static DebounceFilter_t button_debounce;

/**
 * @brief Returns the current Sleep Timer value in milliseconds.
 * @return Current system time converted from Sleep Timer ticks to milliseconds.
 */
static uint32_t get_system_time_ms(void)
{
    return sl_sleeptimer_tick_to_ms(sl_sleeptimer_get_tick_count());
}

/**
 * @brief Initializes the board and continuously processes the button FSM.
 * @return This function does not return during normal operation.
 */
int main(void)
{
    sl_platform_init();
    sl_driver_init();
    sl_service_init();
    sl_internal_app_init();

    CMU_ClockEnable(cmuClock_GPIO, true);
    sl_sleeptimer_init();

    GPIO_PinModeSet(BUTTON_PORT, BUTTON_PIN, gpioModeInputPull, 1U);
    GPIO_PinModeSet(LED_PORT, LED_PIN, gpioModePushPull, LED_OFF);

    bool initial_raw_state = (GPIO_PinInGet(BUTTON_PORT, BUTTON_PIN) == 0U);
    button_fsm_init(&fsm);
    debounce_init(&button_debounce, initial_raw_state);

    while (1) {
        uint32_t current_time_ms = get_system_time_ms();
        bool raw_pressed = (GPIO_PinInGet(BUTTON_PORT, BUTTON_PIN) == 0U);
        bool debounced_pressed = debounce_update(&button_debounce,
                                                raw_pressed,
                                                current_time_ms);

        button_fsm_update(&fsm, current_time_ms, debounced_pressed);
    }
}
