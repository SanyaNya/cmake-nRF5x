#include "ble_nus_c.h"

int main()
{
    ble_nus_c_t nus;
    ble_nus_c_init_t nus_init;
    ble_nus_c_init(&nus, &nus_init);
    return 0;
}