#include "ble_rscs.h"

int main()
{
    ble_rscs_t rscs;
    ble_rscs_init_t rscs_init;
    ble_rscs_init(&rscs, &rscs_init);
    return 0;
}