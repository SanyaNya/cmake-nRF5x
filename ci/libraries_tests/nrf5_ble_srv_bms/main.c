#include "nrf_ble_bms.h"

int main()
{
    nrf_ble_bms_t bms;
    nrf_ble_bms_init_t bms_init;
    nrf_ble_bms_init(&bms, &bms_init);
    return 0;
}