#include "ble_hts.h"

int main()
{
    ble_hts_t hts;
    ble_hts_init_t hts_init;
    ble_hts_init(&hts, &hts_init);
    return 0;
}