#include <stdint.h>
#include "ble_advertising.h"

int main()
{
    ble_advertising_t adv = {};
    ble_advertising_init_t adv_init = {};
    ble_advertising_init(&adv, &adv_init);
    return 0;
}