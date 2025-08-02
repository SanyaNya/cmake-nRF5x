#include "bsp_btn_ble.h"

void bsp_event_callback(bsp_event_t event)
{
}

void bsp_btn_ble_error_handler(uint32_t nrf_error)
{
}

int main()
{
    bsp_event_t event;
    bsp_btn_ble_init(bsp_btn_ble_error_handler, &event);
    return 0;
}