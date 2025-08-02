#include "ble_lns.h"

int main()
{
    ble_lns_t lns;
    ble_lns_init_t lns_init;
    ble_lns_init(&lns, &lns_init);
    return 0;
}