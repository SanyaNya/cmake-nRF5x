#include "ble_nus.h"

int main()
{
    ble_nus_t nus;
    ble_nus_init_t nus_init;
    ble_nus_init(&nus, &nus_init);
    return 0;
}