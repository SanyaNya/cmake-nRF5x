#include "ble_tps.h"

int main()
{
    ble_tps_t tps;
    ble_tps_init_t tps_init;
    ble_tps_init(&tps, &tps_init);
    return 0;
}