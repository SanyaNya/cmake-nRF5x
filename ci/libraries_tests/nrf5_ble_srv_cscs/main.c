#include "ble_cscs.h"

int main()
{
    ble_cscs_t cscs;
    ble_cscs_init_t cscs_init;
    ble_cscs_init(&cscs, &cscs_init);
    return 0;
}