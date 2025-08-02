#include "ble_bps.h"

int main()
{
    ble_bps_t bps;
    ble_bps_init_t bps_init;
    ble_bps_init(&bps, &bps_init);
    return 0;
}