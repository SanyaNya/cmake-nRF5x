#include "nrf_ble_gatts_c.h"

int main()
{
    nrf_ble_gatts_c_t gatts;
    nrf_ble_gatts_c_init_t gatts_init;
    nrf_ble_gatts_c_init(&gatts, &gatts_init);
    return 0;
}