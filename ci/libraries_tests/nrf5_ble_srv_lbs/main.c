#include "ble_lbs.h"

int main()
{
    ble_lbs_t lbs;
    ble_lbs_init_t lbs_init;
    ble_lbs_init(&lbs, &lbs_init);
    return 0;
}